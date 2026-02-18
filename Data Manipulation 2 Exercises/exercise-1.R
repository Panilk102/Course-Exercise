#-----------------------------------------------------------
# Exercise 1: Multi-Domain Join
#-----------------------------------------------------------

# You have:
# ADSL → USUBJID, SAFFL, TRT01A
# VS   → USUBJID, VSTESTCD, VSSTRESN, VISITNUM

# Load library
library(dplyr)

#-----------------------------------------------------------
# 0. Read ADSL and VS datasets
#-----------------------------------------------------------

adsl <- read.csv("ADSL.csv", stringsAsFactors = FALSE)
vs   <- read.csv("VS.csv", stringsAsFactors = FALSE)

#-----------------------------------------------------------
# 1. Check Row Counts Before Join
# Check number of rows in ADSL and VS
# before performing the join.
#-----------------------------------------------------------

# Your code here


#-----------------------------------------------------------
# 2. Join ADSL Population Flags onto VS
# Join SAFFL and TRT01A from ADSL to VS
# using USUBJID.
#-----------------------------------------------------------

vs_joined <- vs %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 3. Filter to Safety Population Only
# Keep records where SAFFL == "Y".
#-----------------------------------------------------------

vs_safety <- vs_joined %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 4. Keep Only Required Parameters
# Keep only:
# SYSBP (Systolic Blood Pressure)
# DIABP (Diastolic Blood Pressure)
# using VSTESTCD.
#-----------------------------------------------------------

vs_bp <- vs_safety %>%
  # Your code here
  
  
  #-----------------------------------------------------------
# 5. Check Row Counts After Join & Filtering
# Check number of rows after:
# - Join
# - Safety filter
# - Parameter filter
#-----------------------------------------------------------

# Your code here


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
