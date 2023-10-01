---
Title: "Getting and Cleaning Data - Week 4 Project"
Author: "Macarena L. Fernandez Carro"
Date: "2023-10-01"
---

# Task 1 --> Merge the training and the test sets to create one data set
# Task 2 --> Extracts only the measurements on the mean and standard deviation for each measurement
# Task 3 --> Uses descriptive activity names to name the activities in the data set
# task 4 --> Appropriately labels the data set with descriptive variable names
# Task 5 --> From the data set in step 4, creates a second, independently tidy data set with the average of each variable for each activity and each subset

#########################################################################

# LOAD LIBRARIES AND DOWNLOAD DATA

library(reshape2)

xTrain <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/features.txt")
activityLabels <- read.table("~/M fernandez touring/PERSONAL DEVELOPMENT/R coursera course/dump/UCI HAR Dataset/activity_labels.txt")

# Place features and labels into new vales for downstream analysis

features[,2] <- as.character(features[,2])
activityLabels[,2] <- as.character(activityLabels[,2])

###########################################################################

## MERGE THE TRAINING DATA AND THE TEST DATA TO PRODUCE TWO SEPARATE DATA SETS

## TRAIN DATA SET

trainingData <- cbind(subjectTrain,xTrain,yTrain)

## TEST DATA SET

testData <- cbind(subjectTest,xTest,yTest)

###########################################################################

## EXTRACT ONLY DATA WITH THE MEAN AND THE STANDARD DEVIATION FOR EACH MEASUREMENT

featuresName <- grep(".*mean.*|.*std.*", features[,2])

############################################################################

## LABEL THE DATA WITH THE DESCRIPTIVE VARIBLE NAMES

featuresNamed <- features[featuresName, 2]
featuresNamed <- gsub("^(f)","Frequency", featuresNamed)
featuresNamed <- gsub("^(t)","Time", featuresNamed)
featuresNamed <- gsub("gravity","Gravity", featuresNamed)
featuresNamed <- gsub("gyro","Gyro", featuresNamed)
featuresNamed <- gsub("body","Body", featuresNamed)
featuresNamed <- gsub("subject","Subject", featuresNamed)
featuresNamed <- gsub("activity","Activity", featuresNamed)
featuresNamed <- gsub("[Jj]erkMag","Jerk_Magnitude", featuresNamed)
featuresNamed <- gsub("[Gg]yroMag","freq", featuresNamed)
featuresNamed <- gsub("-mean","Mean", featuresNamed)
featuresNamed <- gsub("-std$","StdDev", featuresNamed)
featuredNamed <- gsub("[Aa]cc", "Accelerometer", featuresNamed)

## Merges the dataset and adds the labels to the neccessary areas

finalData <- rbind(trainingData, testData)
colnames(finalData) <- c("subject", "activity", featuresNamed)

###########################################################################################################

## USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET

finalData$activity <- factor(finalData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
finalData$subject <- as.factor(finalData$subject)

###########################################################################################################

## CREATES A SECOND INDEPENDENT TIDY DATA SET THAT CONTAINS THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY
## and each subject

## Melts the final data and then creates the new table meanData

meltedData <- melt(finalData, id = c("subject", "activity"))
meanData <- dcast(meltedData, subject + activity ~ variable, mean)

## Writes the table out as a final product

write.table(meanData, "tidy.txt", row.names = FALSE, quote = FALSE)
