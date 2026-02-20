
#-----------------------------------------------------------
# Exercise 1: Derive ADLB from SDTM LB
#-----------------------------------------------------------

# Load libraries


install.packages("haven")
install.packages("usethis")
install.packages("tidyverse")
install.packages("dplyr")

library(dplyr)
library(tidyverse)
library(haven)
library(usethis)

getwd() 

setwd("C:/Users/DSC/Desktop/R Anil")

#-----------------------------------------------------------
# 0. Read SDTM LB and ADSL datasets
#-----------------------------------------------------------


lb = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/SDTM/lb.xpt")
adsl = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/ADAM/adsl.xpt")
adlb= read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/ADAM/adlbc.xpt")


#lb   <- read.csv("sdtm_lb.csv", stringsAsFactors = FALSE)
#adsl <- read.csv("adsl.csv", stringsAsFactors = FALSE)

#-----------------------------------------------------------
# 01. Select Variables
# Select only essential variables:
# STUDYID, USUBJID, LBTEST, LBSTRESN,
# LBSTRESU, LBDTC, VISITNUM.
#-----------------------------------------------------------

adlb_step1 <- lb %>%
  select(STUDYID,USUBJID,LBTEST,LBSTRESN,LBSTRESU,LBDTC,VISITNUM)
  
  
  #-----------------------------------------------------------
# 02. Filter Data
# Filter to Safety Population (SAFFL == "Y")
# and non-missing results.
#-----------------------------------------------------------

adlb_step2 <- adlb %>%
  filter(SAFFL=="Y", !is.na(AVAL))
  
  
  #-----------------------------------------------------------
# 03. Create PARAMCD
# Create PARAMCD from LBTEST:
# "Alanine Aminotransferase" → "ALT"
# "Aspartate Aminotransferase" → "AST"
# "Bilirubin" → "BILI"
#-----------------------------------------------------------

adlb_step3 <- adlb_step1 %>%
 mutate(
   PARAMCD=case_when(
     LBTEST== "Alanine Aminotransferase" ~  "ALT",
     LBTEST== "Aspartate Aminotransferase" ~"AST"  ,     
     LBTEST== "Bilirubin" ~ "BILI"  
   )
 )
  
  
  #-----------------------------------------------------------
# 04. Create AVAL
# Create AVAL from LBSTRESN
# (numeric analysis value).
#-----------------------------------------------------------

adlb_step4 <- adlb_step3 %>%
  mutate(AVAL= as.numeric(LBSTRESN))
  
  
  #-----------------------------------------------------------
# 05. Create AVISITN
# Create AVISITN from VISITNUM.
#-----------------------------------------------------------

adlb_step5 <- adlb_step4 %>%
  mutate(
    AVISITN= case_when(
      VISITNUM == 1 ~ 0,
      VISITNUM > 1 ~ as.integer(VISITNUM)
    )
  )
  
  
  #-----------------------------------------------------------
# 06. Derive ABLFL
# Derive baseline flag (ABLFL)
# where VISITNUM == 0.
#-----------------------------------------------------------

adlb_step6 <- adlb_step5 %>%
    mutate(ABLFL= if_else(AVISITN==0 ,"Y",NA_character_))
  
  
  #-----------------------------------------------------------
# 07. Calculate BASE
# Calculate baseline value (BASE)
# for each USUBJID and PARAMCD.
#-----------------------------------------------------------

adlb_step66 = adlb_step6 %>%
  filter(PARAMCD %in% c("ALT", "AST", "BILI")) |>
  mutate(BASE1=if_else(ABLFL== "Y",AVAL,NA_real_))


baseline <- adlb_step66 %>%
  group_by(USUBJID,PARAMCD) %>%
  mutate(BASE= first(BASE1))
  

  
 # adlb_step7 <- adlb_step6 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 08. Calculate CHG
# Calculate change from baseline
# (CHG = AVAL - BASE).
#-----------------------------------------------------------

adlb_final <- baseline %>%
    mutate( CHG = AVAL-BASE
    )
  
  
  
  #-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
