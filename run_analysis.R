# run_analysis.R
# by github user morbosad
#
# This script
# 1. Merges training and test sets to create one data set
# 2. Extracts only measurements on mean and std dev for eact variable
# 3. Applies descriptive activity names to the activities (SITTING, etc.)
# 4. Labels the dataset variables/columns
# 5. Creates a new, independent data set with avg of each 
#    variable grouped by activity and subject
#
# see README.md for more info

library(dplyr)

# get the zip file if it doesn't exist, extract if required
zipFile <- "UCIdataset.zip"
filedir <- "UCI HAR Dataset"
if (!file.exists(zipFile)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, zipFile, method="curl")
}  
if (!file.exists(filedir)) { 
  unzip(filename) 
}

# file paths
activityNamesFile <- file.path(filedir, "activity_labels.txt")
featuresFile <- file.path(filedir, "features.txt")
testFeaturesFile <- file.path(filedir, "test", "X_test.txt")
testActivityFile <- file.path(filedir, "test", "y_test.txt")
testSubjectFile <- file.path(filedir, "test", "subject_test.txt")
trainFeaturesFile <- file.path(filedir, "train", "X_train.txt")
trainActivityFile <- file.path(filedir, "train", "y_train.txt")
trainSubjectFile <- file.path(filedir, "train", "subject_train.txt")

# get the column names from features file; use only the names
# and store it in a vector
columnNames <- read.table(featuresFile, 
                          stringsAsFactors = FALSE)[,2]

# Prepare to clean up the column names (wait till later to cleanup)
cleanColumnNames <- gsub("^t", "Time", columnNames)
cleanColumnNames <- gsub("^f", "FFT", cleanColumnNames)
cleanColumnNames <- gsub("Acc", "Acceleration", cleanColumnNames)
cleanColumnNames <- gsub("-([[:lower:]])", "\\U\\1", cleanColumnNames, perl=TRUE)
cleanColumnNames <- gsub("[[:punct:]]", "", cleanColumnNames)

# get the activity names and associated activity numbers ("ID" here)
activityNames <- read.table(activityNamesFile,col.names = c("ID", "Activity"),
                            stringsAsFactors = FALSE)

# Read the training features data
trainDF <- read.table(trainFeaturesFile, stringsAsFactors = FALSE,
                      col.names = columnNames)

# get indices of the columns with mean or std in the name (exclude meanFreq)
meanStdColIndex <- grep("mean\\>|std", columnNames, ignore.case = FALSE)
# change column names to be "clean" version
names(trainDF) <- cleanColumnNames
# drop all the columns that aren't mean or std
trainDF<- trainDF[,meanStdColIndex]

# Read the Activity and Subject data, then merge everything together
# Use only the activity name, not the activity ID
trainSubDF <- read.table(trainSubjectFile, col.names = "Subject")
trainActDF <- read.table(trainActivityFile, col.names = "Activity", stringsAsFactors = FALSE)
trainDF <- cbind(trainSubDF, trainActDF, trainDF)

## Now do the same for test data
testDF <- read.table(testFeaturesFile, stringsAsFactors = FALSE,
                     col.names = columnNames)
names(testDF) <- cleanColumnNames
testDF<- testDF[,meanStdColIndex]
testSubDF <- read.table(testSubjectFile, col.names = "Subject")
testActDF <- read.table(testActivityFile, col.names = "Activity")
testDF <- cbind(testSubDF, testActDF, testDF)

# combine the train and test sets into one
DF <- rbind(trainDF, testDF)
DF$Activity <- factor(DF$Activity, levels = activityNames[,1], labels = activityNames[,2])

# cleanup
rm(trainDF, testDF, trainSubDF, testSubDF, trainActDF, testActDF)

# find the average of each variable for each activity and each subject
# (I chose the "wide" option here for the resultant table)
aggrTable <- DF %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)

# write the result to a file
destFile = "data_averages.txt"
write.table(aggrTable, file = destFile, quote = FALSE, row.names = FALSE)
