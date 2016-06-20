#Load the libraries to be used
library(dplyr)
library(tidyr)
library(stringr)

#Read file 
titanic3 <- read.csv("titanic3.csv")

#Changing the values of embarked col. from factor to char
titanic3$embarked <- as.character(titanic3$embarked)
str(titanic3)

#Replacing all the empty strings in embarked col. with S
titanic3$embarked <- gsub("^$", "S",titanic3$embarked)



#Convert age column from Numeric to Int
titanic3$age <- as.integer(titanic3$age)
str(titanic3)
#Summarise the age column
t <- summarise(titanic3, avg_age=mean(age, na.rm=TRUE))
t

#Assign the average value to empty age(rounded off) 
titanic3$age[is.na(titanic3$age)] <- 30

#Coverting the elements of boat col. from factor to char
titanic3$boat <- as.character(titanic3$boat)

#Assigning "NA" string to empty spaces in boat col.
titanic3$boat <- gsub("^$", "NA",titanic3$boat)

#create an empty col. has_cabin_number with length=1310
namevector <- c("has_cabin_number")
titanic3[,namevector] <-  NA
 
#convert cabin col. from factor to char
titanic3$cabin <- as.character(titanic3$cabin)

#iterate over the cabin col. to check for empty elements and enter data in has_cabin_number
for(i in 1:nrow(titanic3)){row <- titanic3[i, "cabin"]
if(row ==""){titanic3$has_cabin_number[i] =0 }else{titanic3$has_cabin_number[i] =1}
  
  }
 #Save file as titanic_clean,csv 
write.csv(titanic3, file="titanic_clean.csv")


