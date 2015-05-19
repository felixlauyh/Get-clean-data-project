#CodeBook for UCI HAR Tidy Dataset

For more details about the origin of the data and the transformation applied, see README.md

There are a total of 180 rows in the data, each representing one subject performing one activity.

There are a total of 30 subjects and 6 different types of activities.

##Identifying information

The first 3 columns provide information about the subject and the activity undertaken.

Field Name | Description | Details
---------- | ----------- | -------
data_set | Whether the subject is in training or test group | 'TRAIN' or 'TEST'
subject | Anonynimized subject identification number | 1 through 30
activity_name | Either one of six different activities | 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING_DOWNSTAIRS' and 'WALKING_UPSTAIRS'

##Mean and standard deviation variables

The clean data consists of an additional 66 variables. They are all averages of mean and standard deviation values for each measurement of each subject and activity.

The values are normalized and bounded within [-1,1]

Field Name | Description
---------- | -----------
tBodyAcc-mean()-X | Average of mean body acceleration time domain signal in the X axis
tBodyAcc-mean()-Y | Average of mean body acceleration time domain signal in the Y axis
tBodyAcc-mean()-Z | Average of mean body acceleration time domain signal in the Z axis
tBodyAcc-std()-X | Average of standard deviation of body acceleration time domain signal in the X axis
tBodyAcc-std()-Y | Average of standard deviation of body acceleration time domain signal in the Y axis
tBodyAcc-std()-Z | Average of standard deviation of body acceleration time domain signal in the Z axis
tGravityAcc-mean()-X | Average of mean gravity acceleration time domain signal in the X axis
tGravityAcc-mean()-Y | Average of mean gravity acceleration time domain signal in the Y axis
tGravityAcc-mean()-Z | Average of mean gravity acceleration time domain signal in the Z axis
tGravityAcc-std()-X | Average of standard deviation of gravity acceleration time domain signal in the X axis
tGravityAcc-std()-Y | Average of standard deviation of gravity acceleration time domain signal in the Y axis
tGravityAcc-std()-Z | Average of standard deviation of gravity acceleration time domain signal in the Z axis
tBodyAccJerk-mean()-X | Average of mean Jerk time domain signal derived from body acceleration in the X axis
tBodyAccJerk-mean()-Y | Average of mean Jerk time domain signal derived from body acceleration in the Y axis
tBodyAccJerk-mean()-Z | Average of mean Jerk time domain signal derived from body acceleration in the Z axis
tBodyAccJerk-std()-X | Average of standard deviation of Jerk time domain signal derived from body acceleration in the X axis
tBodyAccJerk-std()-Y | Average of standard deviation of Jerk time domain signal derived from body acceleration in the Y axis
tBodyAccJerk-std()-Z | Average of standard deviation of Jerk time domain signal derived from body acceleration in the Z axis
tBodyGyro-mean()-X | Average of mean body gyroscope raw time domain signal in the X axis
tBodyGyro-mean()-Y | Average of mean body gyroscope raw time domain signal in the Y axis
tBodyGyro-mean()-Z | Average of mean body gyroscope raw time domain signal in the Z axis
tBodyGyro-std()-X | Average of standard deviation of body gyroscope raw time domain signal in the X axis
tBodyGyro-std()-Y | Average of standard deviation of body gyroscope raw time domain signal in the Y axis
tBodyGyro-std()-Z | Average of standard deviation of body gyroscope raw time domain signal in the Z axis
tBodyGyroJerk-mean()-X | Average of mean jerk signal derived from body gyroscope time domain signal in the X axis
tBodyGyroJerk-mean()-Y | Average of mean jerk signal derived from body gyroscope time domain signal in the Y axis
tBodyGyroJerk-mean()-Z | Average of mean jerk signal derived from body gyroscope time domain signal in the Z axis
tBodyGyroJerk-std()-X | Average of standard deviation of jerk signal derived from body gyroscope time domain signal in the X axis
tBodyGyroJerk-std()-Y | Average of standard deviation of jerk signal derived from body gyroscope time domain signal in the Y axis
tBodyGyroJerk-std()-Z | Average of standard deviation of jerk signal derived from body gyroscope time domain signal in the Z axis
tBodyAccMag-mean() | Average of mean magnitude of 3-dimensional body acceleration time domain signals
tBodyAccMag-std() | Average of standard deviation of magnitude of 3-dimensional body acceleration time domain signals
tGravityAccMag-mean() | Average of mean magnitude of 3-dimensional gravity acceleration time domain signals
tGravityAccMag-std() | Average of standard deviation of magnitude of 3-dimensional gravity acceleration time domain signals
tBodyAccJerkMag-mean() | Average of mean magnitude of 3-dimensional jerk signal derived from body acceleration time domain signals
tBodyAccJerkMag-std() | Average of standard deviation of magnitude of 3-dimensional jerk signal derived from body acceleration time domain signals
tBodyGyroMag-mean() | Average of mean magnitude of 3-dimensional body gyroscope time domain signals
tBodyGyroMag-std() | Average of standard deviation of magnitude of 3-dimensional body gyroscope time domain signals
tBodyGyroJerkMag-mean() | Average of mean magnitude of 3-dimensional jerk signal derived from body gyroscope time domain signals
tBodyGyroJerkMag-std() | Average of standard deviation of magnitude of 3-dimensional jerk signal derived from body gyroscope time domain signals
fBodyAcc-mean()-X | Average of mean body acceleration frequency domain signal in the X axis
fBodyAcc-mean()-Y | Average of mean body acceleration frequency domain signal in the Y axis
fBodyAcc-mean()-Z | Average of mean body acceleration frequency domain signal in the Z axis
fBodyAcc-std()-X | Average of standard deviation of body acceleration frequency domain signal in the X axis
fBodyAcc-std()-Y | Average of standard deviation of body acceleration frequency domain signal in the Y axis
fBodyAcc-std()-Z | Average of standard deviation of body acceleration frequency domain signal in the Z axis
fBodyAccJerk-mean()-X | Average of mean Jerk frequency domain signal derived from body acceleration in the X axis
fBodyAccJerk-mean()-Y | Average of mean Jerk frequency domain signal derived from body acceleration in the Y axis
fBodyAccJerk-mean()-Z | Average of mean Jerk frequency domain signal derived from body acceleration in the Z axis
fBodyAccJerk-std()-X | Average of standard deviation of Jerk frequency domain signal derived from body acceleration in the X axis
fBodyAccJerk-std()-Y | Average of standard deviation of Jerk frequency domain signal derived from body acceleration in the Y axis
fBodyAccJerk-std()-Z | Average of standard deviation of Jerk frequency domain signal derived from body acceleration in the Z axis
fBodyGyro-mean()-X | Average of mean body gyroscope raw frequency domain signal in the X axis
fBodyGyro-mean()-Y | Average of mean body gyroscope raw frequency domain signal in the Y axis
fBodyGyro-mean()-Z | Average of mean body gyroscope raw frequency domain signal in the Z axis
fBodyGyro-std()-X | Average of standard deviation of body gyroscope raw frequency domain signal in the X axis
fBodyGyro-std()-Y | Average of standard deviation of body gyroscope raw frequency domain signal in the Y axis
fBodyGyro-std()-Z | Average of standard deviation of body gyroscope raw frequency domain signal in the Z axis
fBodyAccMag-mean() | Average of mean magnitude of 3-dimensional body acceleration frequency domain signals
fBodyAccMag-std() | Average of standard deviation of magnitude of 3-dimensional body acceleration frequency domain signals
fBodyBodyAccJerkMag-mean() | Average of mean magnitude of 3-dimensional jerk signal derived from body acceleration frequency domain signals
fBodyBodyAccJerkMag-std() | Average of standard deviation of magnitude of 3-dimensional jerk signal derived from body acceleration frequency domain signals
fBodyBodyGyroMag-mean() | Average of mean magnitude of 3-dimensional body gyroscope frequency domain signals
fBodyBodyGyroMag-std() | Average of standard deviation of magnitude of 3-dimensional body gyroscope frequency domain signals
fBodyBodyGyroJerkMag-mean() | Average of mean magnitude of 3-dimensional jerk signal derived from body gyroscope frequency domain signals
fBodyBodyGyroJerkMag-std() | Average of standard deviation of magnitude of 3-dimensional jerk signal derived from body gyroscope frequency domain signals
