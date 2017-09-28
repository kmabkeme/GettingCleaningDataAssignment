### We have already downloaded the data and unzipped the file into our local folder

## Start by setting the working directory to the unzipped folder
setwd("/Users/kristinabkemeier/DataScience/Getting Data - Project/UCI HAR Dataset")

## Read in the data set that correlates the activity codes with the English names of the
## activities. We will need this to join with the activity codes from the data in a bit.
activitylabelsdf <- read.table("activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)

## Need to load data.table to use setnames() so we can change the column names
library(data.table)
setnames(activitylabelsdf, old = c('V1'), new = c('ActivityCodes'))
setnames(activitylabelsdf, old = c('V2'), new = c('ActivityNames'))

## Let's read in the data from the Test folder
setwd("/Users/kristinabkemeier/DataScience/Getting Data - Project/UCI HAR Dataset/test")

xtestdf <- read.table("X_test.txt", header=FALSE, stringsAsFactors=FALSE)
subjtestdf <- read.table("subject_test.txt", header=FALSE)
ytestdf <- read.table("y_test.txt", header=FALSE)

## Change folders to Train, and we read in the same files for the "train" data
setwd("/Users/kristinabkemeier/DataScience/Getting Data - Project/UCI HAR Dataset/train")

xtraindf <- read.table("X_train.txt", header=FALSE, stringsAsFactors=FALSE)
subjtraindf <- read.table("subject_train.txt", header=FALSE)
ytraindf <- read.table("y_train.txt", header=FALSE)

## Now, combine the test and training data sets into complete sets
xdf <- rbind(xtestdf, xtraindf)
subjdf <- rbind(subjtestdf, subjtraindf)
ydf <- rbind(ytestdf, ytraindf)

## Some housekeeping - let's delete the fragments that we no longer need
rm(xtestdf)
rm(xtraindf)
rm(subjtestdf)
rm(subjtraindf)
rm(ytestdf)
rm(ytraindf)

## Change the column name of ydf so that we can do a join with activitylabelsdf
## and get the English label for the activity in each measurement
setnames(ydf, old = c('V1'), new = c('ActivityCodes'))

## We need to read in plyr to be able to do the join
library(plyr)
activityNames <- join(ydf, activitylabelsdf)
ActivityNames <- activityNames[,2]
rm(ydf)
rm(activitylabelsdf)

## Give the subject column a more descriptive label
setnames(subjdf, old = c('V1'), new = c('Subject'))

## Go back up to the main directory level and read in the features.txt file, which 
## contains the labels for each of the measurement columns
setwd("/Users/kristinabkemeier/DataScience/Getting Data - Project/UCI HAR Dataset")
measVariables <- read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)

## The names of the measurements are a bit awkward with parentheses and hyphens in them
## which make it harder to index them later on, so let's get rid of these
## We need to use fixed=TRUE in sub() because we are searching for special characters 
## that otherwise would need to be escaped in order for the function to work
measVariables$V2 <- sub("-mean()-", "Mean", measVariables$V2, fixed=TRUE)
measVariables$V2 <- sub("-mean()", "Mean", measVariables$V2, fixed=TRUE)
measVariables$V2 <- sub("-std()-", "Std", measVariables$V2, fixed=TRUE)
measVariables$V2 <- sub("-std()", "Std", measVariables$V2, fixed=TRUE)

## Rename the columns of the measurements after the cleaned-up measurement variable values
colnames(xdf) <- c(measVariables$V2)
##rm(measVariables)

## Join all of the columns into a big table
alldf <- cbind(subjdf, ActivityNames, xdf)
rm(xdf)
rm(subjdf)
##rm(activityNames)

## Now we need to find the columns that contain the mean values, which contain the
## string "mean"
indx <- grepl("Mean", colnames(alldf))
meanCols <- alldf[, which(indx)]

## However, upon inspection this filtering still left "meanFreq()" columns in the data set,
## so we need to look for and clean out the places where "meanFreq()" appears
indx <- grepl("meanFreq()", colnames(meanCols))
meanColsNoFreq <- meanCols[, which(!indx)]
## And filter out "gravityMean", which is the name of a measurement, not the column
## containing mean values
indx <- grepl("gravityMean", colnames(meanColsNoFreq))
meanColsNoFreqOrGravityMean <- meanColsNoFreq[, which(!indx)]
## And filter out the one column for an angle measurement that contains "Mean" in its
## measurement name, too
indx <- grepl("angle\\(", colnames(meanColsNoFreqOrGravityMean))
meanColsNoFreqOrGravityMeanOrAngle <- meanColsNoFreqOrGravityMean[, which(!indx)]
rm(meanCols)

## And we need to find the columns that contain the standard deviation values, which 
## contain the string "std"
indx <- grepl("Std", colnames(alldf))
stdCols <- alldf[, which(indx)]

## Create a new dataframe that has only the three identifying columns at front
## and then the mean and standard deviation columns only
allMeanAndStdDevdf <- cbind(alldf[,c(1:2)], meanColsNoFreqOrGravityMeanOrAngle, stdCols)
rm(stdCols)
rm(meanColsNoFreq)
rm(meanColsNoFreqOrGravityMean)
rm(alldf)

## Next, we need to creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

## Read in the dplyr library to access the functions that will enable the aggregation
## of the data necessary for generating the new data set
library(dplyr)
## bySubjectAndActivityNames <- group_by(allMeanAndStdDevdf, Subject, ActivityNames)

tidyDataAveraged <- allMeanAndStdDevdf %>% group_by_("Subject", "ActivityNames") %>%
  summarise_all(.funs = c(Mean="mean"))

write.table(tidyDataAveraged, file = "TidyAveragedAvgAndStdDevBySubjectAndActivity.txt",
            row.names=FALSE)