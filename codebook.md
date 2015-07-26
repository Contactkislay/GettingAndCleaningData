---
title: "codebook"
author: "Kislay Kumar"
date: "Sunday, July 26, 2015"
output: html_document
---

## Operations done using the run_analysis.R script

* Once data is downloaded from the source and unzipped; data is loaded in the data frames for training as well as test data sets.
* Then meaningful names are assigned to the columns
* Finally similar data is combined to make final dataset that would be used for further operations.
* Then subsetting of data is done to get the data columns related to Mean and Standard Deviation only using a logical vector.
* Then column names are corrected to make data more intuitive under the final data set.
* In the end tidy data is produced for all the activities and subjects using the final data set.


## Output variables of the output tidy data set

* activityId  
* subjectId  
* timeBodyAccelerationMagnitude_Mean
* timeBodyAccelerationMagnitude_StdDev
* timeGravityAccelerationMagnitude_Mean
* timeGravityAccelerationMagnitude_StdDev
* timeBodyAccJerkMagnitude_Mean
* timeBodyAccJerkMagnitude_StdDev
* timeBodyGyroMagnitude_Mean
* timeBodyGyroMagnitude_StdDev
* timeBodyGyroJerkMagnitude_Mean
* timeBodyGyroJerkMagnitude_StdDev
* freqBodyAccelerationMagnitude_Mean
* freqBodyAccelerationMagnitude_StdDev
* freqBodyBodyAccJerkMagnitude_Mean
* freqBodyBodyAccJerkMagnitude_StdDev
* freqBodyBodyGyroMagnitude_Mean
* freqBodyBodyGyroMagnitude_StdDev
* freqBodyBodyGyroJerkMagnitude_Mean
* freqBodyBodyGyroJerkMagnitude_StdDev
* activityType


## The base attributes of the output tidy data set

* subjectId - The ID of the test subject from where data is getting collected (Integer value)
	* Example: 1,2,3....
* activityId - The type of activity performed when the corresponding measurements were taken (Integer value)
	* Example: 1,2,3....
* activityType - Activity labels corresponding to above activityIds. (Character value)
	* Example:WALKING (activityTypeId=1), 
		        WALKING_UPSTAIRS (activityTypeId=2)
		        WALKING_DOWNSTAIRS (activityTypeId=3)
		        SITTING (activityTypeId=4)
		        STANDING (activityTypeId=5)
		        LAYING (activityTypeId=6)