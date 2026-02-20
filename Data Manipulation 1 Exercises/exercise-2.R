#-----------------------------------------------------------
# Exercise 2: Create Summary Statistics for TFL
# Using ADLB Dataset
#-----------------------------------------------------------
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
# 0. Read ADLB dataset
#-----------------------------------------------------------

adlb= read_xpt("UpdatedCDISCPilotData/UpdatedCDISCPilotData/ADAM/adlbc.xpt")

#-----------------------------------------------------------
# 01. Filter Visits
# Filter to post-baseline visits only
# (AVISITN > 0).
#-----------------------------------------------------------

tfl_step1 <- adlb %>%
  filter(AVISITN>0)
  
  
  #-----------------------------------------------------------
# 02. Filter Tests
# Filter to liver function tests:
# PARAMCD %in% c("ALT", "AST", "BILI").
#-----------------------------------------------------------

tfl_step2 <- tfl_step1 %>%
  filter(PARAMCD %in% c("ALT", "AST", "BILI"))
  
  
  #-----------------------------------------------------------
# 03. Group Data
# Group by:
# Treatment group (TRTGRP),
# Parameter (PARAMCD),
# Visit (AVISITN).
#-----------------------------------------------------------

tfl_step3 <- tfl_step2 %>%
  group_by(TRTP,PARAMCD,AVISITN )
  
  
  #-----------------------------------------------------------
# 04. Calculate Statistics
# Calculate the following:
# N (number of subjects)
# Mean of AVAL
# Standard Deviation of AVAL
# Median of AVAL
# Min of AVAL
# Max of AVAL
# Mean of CHG (change from baseline)
#-----------------------------------------------------------

tfl_step4 <- tfl_step3 %>%
  group_by(TRTP,PARAMCD,AVISITN ) %>%
  summarise(n_a= n(), 
            mean_a= mean(AVAL),
            median_a= median(AVAL,),
            min_a= min(AVAL),
            max_a= max(AVAL),
            mean_chg= mean(CHG),
            .groups="drop"
            )
  
  
  #-----------------------------------------------------------
# 05. Handle Missing Values
# Ensure proper handling of missing values
# (e.g., using na.rm = TRUE).
#-----------------------------------------------------------

tfl_step5 <- tfl_step3 %>%
  group_by(TRTP,PARAMCD,AVISITN ) %>%
  summarise(n_a= n(), 
            mean_a= mean(AVAL,na.rm=TRUE),
            median_a= median(AVAL,na.rm=TRUE),
            min_a= min(AVAL,na.rm=TRUE),
            max_a= max(AVAL,na.rm=TRUE),
            mean_chg= mean(CHG,na.rm=TRUE),
            .groups="drop"
  )
  
  
  #-----------------------------------------------------------
# 06. Drop Grouping
# Remove grouping structure after summarization
# (using .groups = "drop").
#-----------------------------------------------------------

tfl_final <- tfl_step3 %>%
  group_by(TRTP,PARAMCD,AVISITN ) %>%
  summarise(n_a= n(), 
            mean_a= mean(AVAL,na.rm=TRUE),
            median_a= median(AVAL,na.rm=TRUE),
            min_a= min(AVAL,na.rm=TRUE),
            max_a= max(AVAL,na.rm=TRUE),
            mean_chg= mean(CHG,na.rm=TRUE),
            .groups="drop"
  )
  
  
  #-----------------------------------------------------------
# End of Exercise
#-----------------------------------------------------------
