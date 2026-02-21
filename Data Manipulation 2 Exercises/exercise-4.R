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

#distinct(advs,VSTESTCD,.keep_all = FALSE)



params <- c("DIABP", "PULSE",  "SYSBP",  "TEMP")

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
  function(param) { vs_joined|>
      filter(VSTESTCD==params)|>
      group_by(TRT01A,VISIT) |>
      summarise(n_a=n(),
                mean_a=mean(VSSTRESN,na.rm=TRUE),
                sd_a=sd(VSSTRESN,na.rm=TRUE)
                )
    
  }
)

summary_list[[1]]

#-----------------------------------------------------------
# 4. Combine Results
# Combine all parameter summaries
# into one final table
# using bind_rows().
#-----------------------------------------------------------

final_summary <- 
  bind_rows(summary_list)
  
  
  #-----------------------------------------------------------
# 5. Review Final Output
#-----------------------------------------------------------

# Your code here


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
