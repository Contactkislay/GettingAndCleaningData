---
title: "README"
author: "Kislay Kumar"
date: "Sunday, July 26, 2015"
output: html_document
---

## Getting and Cleaning Data

Repository for the submission of the Data Science course project for Getting and Cleaning Data course.

### Project Overview

The purpose of this project is to demonstrate the collection and cleaning of a tidy data set that can be used for further analysis.  Full description of data is available at the site at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Script (run_analysis.R) Details
Data can be obtained from the source using the commented section on top of the script run_analysis.R. Once data files are available in parent folder "UCI HAR Dataset" under the working directory, analysis of data can be done using the script run_analysis.R.

### Project Objective
The following are the objective of project that would be acheived using the script run_analysis.R
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Additional Information
Additional information about the variables, data and transformations can be found in CodeBook.MD file.