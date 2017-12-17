# Getting and Cleaning Data Week 4 Peer Graded Assignment

#You should create one R script called run_analysis.R that does the following:

#1: Merges the training and the test sets to create one data set.
     # source data from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
     # orginal data files located at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

     #load libraries needed for this script:
     library(data.table)
     # dplyr does not seem to play well with plyr.  Detach plyr if loaded
     if("package:plyr" %in% search()){detach("package:plyr", unload=TRUE)}
     library(dplyr)
     
     # read and merge the training and test data sets for each group:
     dFolder <- file.path(getwd(), "UCI HAR Dataset")
     
     tempDataTrain <- read.table(file.path(dFolder, "train/subject_train.txt"))
     tempDataTest <- read.table(file.path(dFolder, "test/subject_test.txt"))
     subjectData <- rbind(tempDataTrain, tempDataTest)
     #lable with descriptive variable names - requirement #4 
     names(subjectData) <- "subject"
     
     tempDataTrain <- read.table(file.path(dFolder, "train/X_train.txt"))
     tempDataTest <- read.table(file.path(dFolder, "test/X_test.txt"))
     xData <- rbind(tempDataTrain, tempDataTest)
     #lable with descriptive variable names - requirement #4 
     features <- read.table(file.path(dFolder, "features.txt"))
     names(xData) <- features[ ,2]
     
     tempDataTrain <- read.table(file.path(dFolder, "train/Y_train.txt"))
     tempDataTest <- read.table(file.path(dFolder, "test/Y_test.txt"))
     yData <- rbind(tempDataTrain, tempDataTest)
     #lable with descriptive variable names - requirement #4 
     names(yData) <- "activity"
     
     #merge all datasets into xData - since merging by index number of each dataset, this a a simple cbind
     xData <- cbind(subjectData, yData, xData)
     
#2: Extracts only the measurements on the mean and standard deviation for each measurement.
     # find a logical of xBind variable names containing "mean" or "std"
     # but also keep the first 2 column (subject and activity)
     lGoodNames <- c(TRUE, TRUE, grepl("-mean\\(\\)|-std\\(\\)", names(xData[3:ncol(xData)])))
     xData <- xData[ , lGoodNames]
     #tidy up variable names by removing () 
     names(xData) <- gsub("\\(|\\)", "", names(xData))
     
#3: Uses descriptive activity names to name the activities in the data set
     # read in activity names
     activityNames <- read.table(file.path(dFolder, "activity_labels.txt"))
     # tidy up activity names
     activityNames[ ,2] <- tolower(activityNames[ ,2])
     activityNames[ ,2] <- gsub("_", "", activityNames[ ,2])
     # replace activity numbers with activity names
     xData$activity <- activityNames[xData$activity, 2]
     # tidy up variable class of subject and activity variables to be factors
     xData$subject <- as.factor(xData$subject)
     xData$activity <- as.factor(xData$activity)
     
#4: Appropriately labels the data set with descriptive variable names.
     # performed amoungst step #1 above

#5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     byActSub <- group_by(xData, activity, subject)
     tidyData <- summarise_all(byActSub, mean)
     # write xData and tidy_data back to disk for future analysis
     write.csv(tidyData, file = file.path(dFolder, "tidyData.csv"))
     write.csv(xData, file = file.path(dFolder, "xData.csv"))