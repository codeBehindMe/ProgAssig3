#this function is used to find the best hospital in the state for a particular outcome
# this function takes 2 arguments, a 2letter abbriviated state and a outcome name.

best <- function(state,outcome){
      
      # we first need to set the working directory
      
      setwd("C:/Users/HAZARDAZ/Documents/Data Science/Assignment 3/rprog-data-ProgAssignment3-data")
      
      # read the data into a data frame (all columns stored as character)
      df_outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      
      ## now we need to do the checks before we move on with the ranking
      # check that the passed in variables are valid
      
            #iterate through the number of rows
      
      t_state <- FALSE #this temp variable stores if the state is valid or not
            for(i in 1:nrow(df_outcome)){
                  if(df_outcome[i,7] == state){
                        t_state <- TRUE
                        break
                  }  
            }
      
      if (t_state == FALSE) stop("invalid state") # check the condition and break if necessary
      
      #now we need to check the outcome is valid
      c_outcomes <- c("heart attack","heart failure","pneumonia")
      
      if(outcome %in% c_outcomes == FALSE) stop("invalid outcome") #check the condition and break if necessary
      
      
      # now that we have passed the checks do the body of the function
      
            #lets extract the columns of interest from the df_outcome (namely hospital.name and )
      
      
}