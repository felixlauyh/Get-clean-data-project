## import library
library(dplyr)

## Download data from source if data does not already exist
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("UCI HAR Dataset")) {
  download.file(url, dest="UCI HAR Dataset.zip", mode="wb") 
  unzip ("UCI HAR Dataset.zip", exdir = ".")
  file.remove("UCI HAR Dataset.zip") 
}

## Read test data set
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE, na.strings = "N/A", stringsAsFactors = FALSE)

## Read training data set
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE, na.strings = "N/A", stringsAsFactors = FALSE)

## Read descriptive activity and variable names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
colnames(activity_labels) <- c("activity_label", "activity_name")
features <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)[, 2]

## Merge the training and test data set together
data_test <- cbind("TEST", subject_test, y_test, X_test)
data_train <- cbind("TRAIN", subject_train, y_train, X_train)

## Rename the column labels to facilitate merging the activity label
colnames(data_test)[1:3] <- c("data_set", "subject", "activity_label")
colnames(data_train)[1:3] <- c("data_set", "subject", "activity_label")

## Merge the descriptive activity labels back into the dataset
data_test <- merge(data_test, activity_labels, by = "activity_label")
data_train <- merge(data_train, activity_labels, by = "activity_label")

## Merge the training and test data sets to one data set
data <- rbind(data_train, data_test)

## Rename the column labels to add descriptive variable names
colnames(data) <- c("activity_label", "data_set", "subject", features, "activity_name")

## Extract only the measurements on the mean and standard deviation for each measurement
## Here I'm assuming that the column names contain the word "mean" or "std" (not case sensitive)
trimmed_data <- tbl_df(data[, grep("data_set|subject|activity_name|mean|std", colnames(data), ignore.case = TRUE)])

## Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata <- trimmed_data %>%
  group_by(data_set, subject, activity_name) %>%
  summarise_each(funs(mean)) %>%
  arrange(data_set, subject, activity_name)

## Export the result as a text file 'UCI HAR Tidy Dataset.txt'
write.table(tidydata, file = "UCI HAR Tidy Dataset.txt", row.names = FALSE)