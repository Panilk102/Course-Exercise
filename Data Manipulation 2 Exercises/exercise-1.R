
install.packages("haven")
install.packages("usethis")
install.packages("tidyverse")
install.packages("dplyr")



#-----------------------------------------------------------
# Exercise 1: Multi-Domain Join
#-----------------------------------------------------------

# You have:
# ADSL → USUBJID, SAFFL, TRT01A
# VS   → USUBJID, VSTESTCD, VSSTRESN, VISITNUM

# Load library
library(dplyr)
library(tidyverse)
library(haven)
library(usethis)

getwd() 

setwd("C:/Users/DSC/Desktop/R Anil")


#-----------------------------------------------------------
# 0. Read ADSL and VS datasets
#-----------------------------------------------------------



vs = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/SDTM/vs.xpt")
adsl = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/ADAM/adsl.xpt")



#-----------------------------------------------------------
# 1. Check Row Counts Before Join
# Check number of rows in ADSL and VS
# before performing the join.
#-----------------------------------------------------------


slv=n_distinct(adsl$USUBJID)
slvS=n_distinct(vs$USUBJID)

#-----------------------------------------------------------
# 2. Join ADSL Population Flags onto VS
# Join SAFFL and TRT01A from ADSL to VS
# using USUBJID.
#-----------------------------------------------------------

vs_joined = vs %>%
  inner_join(adsl, by=c("STUDYID","USUBJID"))
  
  
  #-----------------------------------------------------------
# 3. Filter to Safety Population Only
# Keep records where SAFFL == "Y".
#-----------------------------------------------------------

vs_safety <- vs_joined %>%
  filter(SAFFL=="Y")
  
  
  #-----------------------------------------------------------
# 4. Keep Only Required Parameters
# Keep only:
# SYSBP (Systolic Blood Pressure)
# DIABP (Diastolic Blood Pressure)
# using VSTESTCD.
#-----------------------------------------------------------

vs_bp <- vs_safety %>%
  filter(VSTESTCD %in% c("SYSBP", "DIABP"))
  
  
  #-----------------------------------------------------------
# 5. Check Row Counts After Join & Filtering
# Check number of rows after:
# - Join
# - Safety filter
# - Parameter filter
#-----------------------------------------------------------

nrow(vs_joined)
nrow(vs_safety)
nrow(vs_bp)


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
