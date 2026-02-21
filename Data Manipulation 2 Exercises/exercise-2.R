#-----------------------------------------------------------
# Exercise 2: Transpose for Table
#-----------------------------------------------------------

# Starting dataset: ADVS (long format)

# Goal:
# Rows    → Treatment groups (TRT01A)
# Columns → Visit (AVISIT)
# Values  → Mean AVAL for SYSBP
# Use group_by() + summarise() + pivot_wider()

# Load libraries
library(dplyr)
library(tidyr)

#-----------------------------------------------------------
# 0. Read ADVS dataset
#-----------------------------------------------------------


advs = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/SDTM/vs.xpt")
adsl = read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/ADAM/adsl.xpt")

#joined with adsl to get treatment variables
vs_joined = vs %>%
  inner_join(adsl, by=c("STUDYID","USUBJID"))

#-----------------------------------------------------------
# 1. Filter Parameter
# Keep only SYSBP records
# using PARAMCD or VSTESTCD (as applicable).
#-----------------------------------------------------------

step1 <- vs_joined %>%
 filter(VSTESTCD=="SYSBP")
  
  
  #-----------------------------------------------------------
# 2. Group Data
# Group by:
# Treatment group (TRT01A)
# Visit (AVISIT)
#-----------------------------------------------------------

step2 <- step1 %>%
  group_by(TRT01A,VISIT)
  
  
  #-----------------------------------------------------------
# 3. Calculate Mean AVAL
# Calculate mean of AVAL
# for each TRT01A + AVISIT group.
#-----------------------------------------------------------

step3 <- step2 %>%
  group_by(TRT01A,VISIT) |>
  summarise(mean_a=mean(VSSTRESN,na.rm=TRUE), .groups = "drop")
  
  #-----------------------------------------------------------
# 4. Transpose to Wide Format
# Create wide table:
# Rows    → TRT01A
# Columns → AVISIT
# Values  → Mean AVAL
# Use pivot_wider().
#-----------------------------------------------------------

tfl_table <- step3 %>%
  pivot_wider(
    id_cols = VISIT,
    values_from = mean_a,
    names_from = TRT01A 
  )
  

  #-----------------------------------------------------------
# 5. Final Table Output
# Review the transposed table.
#-----------------------------------------------------------

# Your code here


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
