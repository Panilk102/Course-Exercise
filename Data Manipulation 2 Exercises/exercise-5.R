#-----------------------------------------------------------
# Exercise 5: Date Derivations
#-----------------------------------------------------------

# Given:
# TRTSDT  = "2024-01-15"
# AESTDTC = "2024-01-20"

# Goals:
# 1. Convert both to Date objects
# 2. Derive Study Day (ASTDY) following CDISC rules (no Day 0)
# 3. Calculate duration in days
# 4. Verify what ASTDY should be

#-----------------------------------------------------------
# 0. Create Input Data
#-----------------------------------------------------------

trtsdt_char  <- "2024-01-15"
aestdtc_char <- "2024-01-20"

#-----------------------------------------------------------
# 1. Convert to Date Objects
# Convert TRTSDT and AESTDTC
# from character to Date format.
#-----------------------------------------------------------

trtsdt <- as.Date(trtsdt_char)
  
aestdtc <- ymd(aestdtc_char)
  
  
  #-----------------------------------------------------------
# 2. Derive Study Day (ASTDY)
# Follow CDISC rules:
# - No Day 0
# - If event date ≥ treatment start → positive day
# - If event date < treatment start → negative day
#-----------------------------------------------------------


astdy <- 
  as.integer(trtsdt-aestdtc) + if_else(aestdtc >= trtsdt, 1L,0L)
  
  
  #-----------------------------------------------------------
# 3. Calculate Duration
# Calculate difference in days
# between AESTDTC and TRTSDT.
#-----------------------------------------------------------

duration_days <- 
  as.integer(trtsdt-aestdtc) + 1
  
  
  #-----------------------------------------------------------
# 4. Verify ASTDY
# Print or check ASTDY value.
#-----------------------------------------------------------

view(astdy)


#-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------


trstdt = "2026-02-21"

adt = c("2026-02-18", "2026-02-19", "2026-02-20", "2026-02-21", "2026-02-22", "2026-02-23" )

dtf = data.frame(trstdt, adt)


adtdy = dtf |>
  mutate(ady = as.integer(as.Date(adt)-as.Date(trstdt)) + if_else(as.Date(adt) >= as.Date(trstdt),1L,0L),
         dun =as.integer(as.Date(adt)-as.Date(trstdt)) +1)




