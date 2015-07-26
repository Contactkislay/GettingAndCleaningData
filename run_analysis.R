
## Downloading the zip fle, unzip the downloaded file and setting working directory would be one time job
## So commenting this section out to make this script re-runnable
# filename <- "GetDataset_UCIHAR.zip"
# 
# # Download the dataset from the given URL
# if (!file.exists(filename)){
#   fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
#   download.file(fileURL, filename, method="curl")
# }
# # Unzip the downloaded file
# if (!file.exists("UCI HAR Dataset")) { 
#   unzip(filename) 
# }
# 
# #Set working directory to the location where the UCI HAR Dataset was unzipped
# setwd('./UCI HAR Dataset/');


# Read in the training and base data from downloaded files
features      = read.table('./features.txt',header=FALSE); 
activities    = read.table('./activity_labels.txt',header=FALSE); 
subject_train = read.table('./train/subject_train.txt',header=FALSE); 
x_train       = read.table('./train/x_train.txt',header=FALSE); 
y_train       = read.table('./train/y_train.txt',header=FALSE); 

# Read in the test data from downloaded files
subject_test = read.table('./test/subject_test.txt',header=FALSE); 
x_test       = read.table('./test/x_test.txt',header=FALSE); 
y_test       = read.table('./test/y_test.txt',header=FALSE); 

# Assigin column names to the data loaded above
colnames(activities)  = c('activityId','activityType');
colnames(subject_train)  = "subjectId";
colnames(x_train)        = features[,2]; 
colnames(y_train)        = "activityId";

# Assign column names to the test data imported above
colnames(subject_test) = "subjectId";
colnames(x_test)       = features[,2]; 
colnames(y_test)       = "activityId";

# Create the combined training data set by merging y_train, subject_train, and x_train
trainingData = cbind(y_train,subject_train,x_train);

# Create the combined test data set by merging the x_test, y_test and subject_test data
testData = cbind(y_test, subject_test, x_test);

# Combine training and test data to create a final data
finalData = rbind(trainingData, testData);

# Create a vector for the column names from the finalData
colNames  = colnames(finalData); 

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Create a Logical Vector that contains TRUE values for the mean() & stddev() columns
logicalVector_MeanStd = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

# Subset finalData table based on the logicalVector_MeanStd
finalData = finalData[logicalVector_MeanStd==TRUE];

## 3. Use descriptive activity names to name the activities in the data set

# Merge the finalData set with the acitivityType table to include descriptive activity names
finalData = merge(finalData,activities,by='activityId',all.x=TRUE);

# Updating the colNames for merged data above
colNames  = colnames(finalData); 

## 4. Appropriately label the data set with descriptive activity names. 

# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","_StdDev",colNames[i])
  colNames[i] = gsub("-mean","_Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccelerationMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccelerationJerkMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]ody | [Bb]ody[Bb]ody)","Body",colNames[i])  
  
};

# Reassigning the descriptive column names from above to the finalData set
colnames(finalData) = colNames;

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Create a new table, finalDataNoActivities without the activityType column
finalDataNoActivities  = finalData[,names(finalData) != 'activityType'];

# Summarizing the finalDataNoActivities table to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(finalDataNoActivities[,names(finalDataNoActivities) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivities$activityId,subjectId = finalDataNoActivities$subjectId),mean);

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);

# Export the tidyData to a text file with tab separator 
write.table(tidyData, './tidyData_Accelerometer.txt',row.names=TRUE,sep='\t');