#-----------------------------------------------------------
# Exercise 1: Derive ADLB from SDTM LB
#-----------------------------------------------------------

# Load libraries
library(dplyr)

#-----------------------------------------------------------
# 0. Read SDTM LB and ADSL datasets
#-----------------------------------------------------------

lb   <- read.csv("sdtm_lb.csv", stringsAsFactors = FALSE)
adsl <- read.csv("adsl.csv", stringsAsFactors = FALSE)

#-----------------------------------------------------------
# 01. Select Variables
# Select only essential variables:
# STUDYID, USUBJID, LBTEST, LBSTRESN,
# LBSTRESU, LBDTC, VISITNUM.
#-----------------------------------------------------------

adlb_step1 <- lb %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 02. Filter Data
# Filter to Safety Population (SAFFL == "Y")
# and non-missing results.
#-----------------------------------------------------------

adlb_step2 <- adlb_step1 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 03. Create PARAMCD
# Create PARAMCD from LBTEST:
# "Alanine Aminotransferase" → "ALT"
# "Aspartate Aminotransferase" → "AST"
# "Bilirubin" → "BILI"
#-----------------------------------------------------------

adlb_step3 <- adlb_step2 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 04. Create AVAL
# Create AVAL from LBSTRESN
# (numeric analysis value).
#-----------------------------------------------------------

adlb_step4 <- adlb_step3 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 05. Create AVISITN
# Create AVISITN from VISITNUM.
#-----------------------------------------------------------

adlb_step5 <- adlb_step4 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 06. Derive ABLFL
# Derive baseline flag (ABLFL)
# where VISITNUM == 0.
#-----------------------------------------------------------

adlb_step6 <- adlb_step5 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 07. Calculate BASE
# Calculate baseline value (BASE)
# for each USUBJID and PARAMCD.
#-----------------------------------------------------------

baseline <- adlb_step6 %>%
  # Your code here
  
  
  adlb_step7 <- adlb_step6 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 08. Calculate CHG
# Calculate change from baseline
# (CHG = AVAL - BASE).
#-----------------------------------------------------------

adlb_final <- adlb_step7 %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
