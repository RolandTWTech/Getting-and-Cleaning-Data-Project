# Codebook for Getting and Cleaning Data Project

## Reference
* Data for project and information for this codebook mostly sourced from file "features_info.txt" from the zip file located: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Background info for project can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Project Study Info
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Files included in GitHub repo: https://github.com/RolandTWTech/Getting-and-Cleaning-Data-Project
* xData.csv: this includes the data from six original data files: subject data, activity type data and observation results data for both trials and testing.
* tidyData.csv: this includes the mean of the observations in xData.csv grouped by subject and activity.

## Variables captured for each observation in xData.csv:
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

## Variables included in tidyData.csv:
The set of variables originally produced in the study have been subsetted to only include the following that were estimated from these signal: 
*mean(): Mean value
*std(): Standard deviation
