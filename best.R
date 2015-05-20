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
      
      #store the column numbers and names in a list
      c_outcomes <- list("heart attack"=11,"heart failure"=17,"pneumonia"=23)
      
      
      if(outcome %in% names(c_outcomes) == FALSE) stop("invalid outcome") #check the condition and break if necessary
      
      
      # now that we have passed the checks do the body of the function
      
      
            #lets extract the columns of interest from the df_outcome (namely hospital.name and the selected outcome col)
      
      v_colOfInt <- c_outcomes[[outcome]] #get the col numer of the outcome of intrest
      
      #subset the values of the cols and rows of interest in the a df
      
      df_outOfInt <- subset(df_outcome, State == state,select=c(2,7,v_colOfInt))
      
      #cast the mortality rate column as numeric
      df_outOfInt[,3] <- as.numeric(df_outOfInt[,3])
      
      #lets recover only complete cases
      df_outOfInt <- df_outOfInt[complete.cases(df_outOfInt),]
      
      #order the data frame by ascending order for death rate and hospital.name
      df_outOfInt <- df_outOfInt[order(df_outOfInt[,3],df_outOfInt[,1]),]
      
      top <- as.vector(df_outOfInt[1,1])
      
      #set back to the rpog wd so that dont have to keep setting it to submit
      setwd("C:/Users/HAZARDAZ/Documents/Data Science/Assignment 3/rprog-data-ProgAssignment3-data/ProgAssig3")
      return(top)
      
}