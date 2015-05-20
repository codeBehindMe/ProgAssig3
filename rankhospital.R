rankhospital <- function(state,outcome,num) {
      
      # we first need to set the working directory
      setwd("C:/Users/HAZARDAZ/Documents/Data Science/Assignment 3/rprog-data-ProgAssignment3-data")
      
      # read the data into a data frame (all columns stored as character)
      df_outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      ## check the validity of the arguments
      
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
      
      # check that the num varriable is valid
      
      t_num <-FALSE #temp variable to keep class
      
      if (class(num) == "numeric") t_num = TRUE
      if (num == "best") t_num = TRUE
      if (num == "worst") t_num = TRUE
      
      #check the the num has passed
      if (t_num == FALSE) stop("invalid ranking input")
      
     
      # now that the tests have passed, make a subset of the dataframe
      v_colOfInt <- c_outcomes[[outcome]] #get the col numer of the outcome of intrest
      #subset teh data into a df with the observations of interest
      df_obsOfInt <- subset(df_outcome,State == state,select=c(2,7,v_colOfInt))
      
      #cast the mortality rate column as numeric
      df_obsOfInt[,3] <- as.numeric(df_obsOfInt[,3])
      
      #recover complete cases
      df_obsOfInt <- df_obsOfInt[complete.cases(df_obsOfInt),]
      
      #rearrange the dataframe by ascending order for deathrate and hospital.name
      df_obsOfInt <- df_obsOfInt[order(df_obsOfInt[,3],df_obsOfInt[,1]),]
      
      #now we need to handle the best and worst inputs in the num
      if (num == "best") num <- 1
      if (num == "worst") num <- length(df_obsOfInt[,1])
      
      #set back to the rpog wd so that dont have to keep setting it to submit
      setwd("C:/Users/HAZARDAZ/Documents/Data Science/Assignment 3/rprog-data-ProgAssignment3-data/ProgAssig3")
      
      #now simply pull the record thats requested by the num
      return(as.vector(df_obsOfInt[num,1]))
      
      
}