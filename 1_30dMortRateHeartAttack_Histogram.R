## This function contains part 1 (not for submission)
# Plot the 30-day mortality rates for heart attack.

# --------------------------------------------------- #

# set the working directory where the files are contained
setwd("C:/Users/HAZARDAZ/Documents/Data Science/Assignment 3/rprog-data-ProgAssignment3-data")

r_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#cast r_outcome as numeric vector. Also extract the 30 day mortality rate column (which is colnumber=11)

r_outcome[,11] <-as.numeric(outcome[,11])

#plot a histogram of the 30-day mortality rates

hist(outcome[,11])