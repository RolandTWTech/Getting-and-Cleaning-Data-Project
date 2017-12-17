# Getting-and-Cleaning-Data-Project
Github repo for Getting and Cleaning Data class project

## Summary
This reposititory merges data from three files into one and produces average values for each subject and each activity.  The average values have been subsetted to include only variables that are the means and standard deviations of observations.

## Outputs
The repo includes the following outputs:
  * Script "run_analysis.R" which will reproduce the output csv files listed below.
  * Output file "tidyData.csv" which presents an independant tidy data set with the average of each variable for each activity and each subject as a csv file.
  * Output file "xData.csv" which present the merged observation data for the subjects, activities, training and testing result variable data.  This data has been subcetted to only include the observational data for the means and standard deviations of the observational data.  Descriptive variable names have been assigned to the variables using tidy data principals.  Presented in csv format.
  * This "README.md" markdown file which gives an overview of the project and repo contents.
  * A "codebook.md" markdown file that modifies and updates previously available codebooks with data to indicate all variables and summaries.
  
## References
Data obtained from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
