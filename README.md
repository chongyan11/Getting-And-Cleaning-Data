# Getting And Cleaning Data - Course Project
23 May 2019
This is a submission by Lim Chong Yan in partial fulfilment of the course completion criteria on Cousera's Getting and Cleaning Data Course

## Files in this Repository
1. run_analysis.R
    - This code performs 5 functions
       a. Retrieves data from [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and loads them into R.
       b. Merges Training and Test Datasets
       c. Extracts only data for mean and standard deviation measurements
       d. Names and labels extracted dataset appropriately
       e. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
2. TidyData.txt
    - This is the data derived from running run_analysis.R
3. README.md
    - This file.
4. CodeBook.md
    - Contains all descriptions of variables derived as a result of this study
