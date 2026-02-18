#-----------------------------------------------------------
# Exercise 4: Loop Over Parameters
#-----------------------------------------------------------

# Parameters to process:
# SYSBP, DIABP, PULSE, TEMP

# Goal:
# 1. Filter ADVS to each parameter
# 2. Calculate N, Mean, SD by Treatment and Visit
# 3. Combine all results into one summary table
# Hint: Use map() + bind_rows()

#-----------------------------------------------------------
# 0. Load Libraries
#-----------------------------------------------------------

library(dplyr)
library(purrr)

#-----------------------------------------------------------
# 1. Read ADVS Dataset
#-----------------------------------------------------------

advs <- read.csv("ADVS.csv", stringsAsFactors = FALSE)

#-----------------------------------------------------------
# 2. Create Parameter List
# Store vital signs parameters in a vector.
#-----------------------------------------------------------

params <- c(
  # Your code here
)

#-----------------------------------------------------------
# 3. Loop Over Parameters Using map()
# For each parameter:
#   - Filter dataset
#   - Group by TRT01A and AVISIT
#   - Calculate:
#       N
#       Mean of AVAL
#       SD of AVAL
#-----------------------------------------------------------

summary_list <- map(
  params,
  function(param) {
    
    # Your code here
    
  }
)

#-----------------------------------------------------------
# 4. Combine Results
# Combine all parameter summaries
# into one final table
# using bind_rows().
#-----------------------------------------------------------

final_summary <- 
  # Your code here
  
  
  #-----------------------------------------------------------
# 5. Review Final Output
#-----------------------------------------------------------

# Your code here


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
