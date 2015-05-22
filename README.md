#Coursera Data Science Specialization - Getting and Cleaning Data Course Project

This analysis is undertaken as part of Coursera Data Science Specialization Getting and Cleaning Data Course Project

The full package consists of 3 files:

* this README.md
* run_analysis.R - a script written in R that transforms the source data into a clean tidy dataset
* CodeBook.md - describes the data and variables in that tidy dataset

## The Source Data

This dataset originated from an experiment conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto at the Smartlab - Non Linear Complex Systems Laboratory of the Università degli Studi di Genova in Genoa, Italy. [1]

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The data is downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For more information about this dataset contact: activityrecognition@smartlab.ws

###Data Utilized in this Analysis

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject in the training group who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/subject_test.txt': Each row identifies the subject in the test group who performed the activity for each window sample. Its range is from 1 to 30. 

###Data not Directly Utilized in this Analysis
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
* 'test/Inertial Signals/total_acc_x_test.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the Y and Z axis. 
* 'test/Inertial Signals/body_acc_x_test.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'test/Inertial Signals/body_gyro_x_test.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


##Getting and Cleaning the Data

The cleanup exercise is completed as per course project guideline[2]: 

###Getting the data
The script checks if files exist in the directory "UCI HAR Dataset". If not, it will attempt to download the original dataset from the URL above, unzip the file and place the data in a new directory "UCI HAR Dataset" under your working directory

###Reading the training and test dataset into various variables
The following data files are read assuming no header. Any **N/A** strings are converted to **NA**

Variable | Data File | Dimension of Data
-------- | --------- | -----------------
subject_train | subject_train.txt | 7352 observations of 1 variable
y_train | y_train.txt | 7352 observations of 1 variable
x_train | X_train.txt | 7352 observations of 561 variables
subject_test | subject_test.txt | 2947 observations of 1 variable
y_test | y_test.txt | 2947 observations of 1 variable
x_test | X_test.txt | 2947 observations of 561 variable

The file 'activity_labels.txt' is read into a new variable called activity_lables. It has 6 rows of data consisting of the activity index value (1 to 6) and the description of the six activities. Its index values are tied to y_train and y_test.

Additionally, the file 'features.txt' is read into a new vector called features. It has 561 rows of data consisting of the feature index value (1 to 561) and the description of the 561 variables. Its index values are tied to the column number of x_train and x_test. For the purpose of this analysis, the first column of data containing the index value is ignored.

###Merging the data
Judging from the dimension and _lego-blocks-like_ shape of the dataset, it is assumed that the data can simply be put back together using *cbind* and *rbind*
	
The training and test data set is combined together using *cbind* in this order, resulting in two new variables data_train and data_test:

1. A new column indicating the type of the dataset (whether TRAIN or TEST)
2. Subject (either subject_train or subject_test)
3. Activity (either y_train or y_test)
4. 561 measurements/variables from the study (either x_train or x_test)

The variables y_train and y_test contain the activity labels (number 1 through 6) but not the descriptive labels. As a result, the list of activity description is merged into y_train and y_test as a new column called activity_name by referencing the index labels

Note that x_train.txt and x_test.txt have no column (i.e. variable) names
The column names of the 561 measurements/variables are renamed based on the variable features, again assuming the data is organized in _lego-block_ fashion

The training and test dataset are then combined together to form a new variable **data** simply using *rbind*.
A new column called "data_set" is created to indicate whether the original data is for training or test

###Simplifying the data
Per the course guideline, the dataset should only contain mean and standard deviation data

Note that there are three types of "mean" value in the original dataset. According to the codebook provided with the original study, their definitions are:

1. mean(): Mean value
2. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
3. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
	* gravityMean
	* tBodyAccMean
	* tBodyAccJerkMean
	* tBodyGyroMean
	* tBodyGyroJerkMean

Here I'm making the assumption that only the first definition of mean value is relevant for this exercise as the other two are either weighted averages or sampled mean and for the purpose of this exercise cannot be considered "mean of the measurements".

Standard deviation on the other hand is easier as there is only one definition: *std*

As a result, the column variables are filtered to exclude everything except column variables that contain the words *mean()* or *std* using the *grep* function
For precaution, ignore.case = TRUE is used

The merged data set is stripped of all columns except the following data and a new variable **trimmed_data** is created:

1. origin of the dataset (either TRAIN or TEST)
2. subject (numeric value 1 through 30)
3. activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
4. mean and standard deviation for each measurement (column variable names contain the words 'mean()' or 'std')

###Tidying up and exporting the data
A final tidy dataset is created and stored in a new variable **tidydata** by taking the average of each variable grouped by each subject and each activity. Note that the information about whether the subject is in the training or test group is retained to facilitate easy analysis.
The result is written into a text file called 'UCI HAR Tidy Dataset.txt'
To read the data, you may run this piece of code [3]
>data <- read.table("UCI HAR Tidy Dataset.txt", header = TRUE)

For more details about the resulting data, see CodeBook.md

**NOTES**

* to run the run_analysis.R script, you must have the "dplyr" package installed
* the script was successfully run using R version 3.2.0 and R Studio Version 0.98.1103 in Windows 8.1
* The script does not require additional user input or any manual intervention


####Acknowledgements:

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
2. Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD. Coursera Getting and Cleaning Data course project guideline.
3. David Hood. Community discussion form. https://class.coursera.org/getdata-014/forum/thread?thread_id=30