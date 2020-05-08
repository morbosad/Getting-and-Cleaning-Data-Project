#Here are the data for the project:
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# file paths
filedir <- "UCI HAR Dataset"
activityNamesFile <- file.path(filedir, "activity_labels.txt")
featuresFile <- file.path(filedir, "features.txt")
testFeaturesFile <- file.path(filedir, "test", "X_test.txt")
testActivityFile <- file.path(filedir, "test", "y_test.txt")
testSubjectFile <- file.path(filedir, "test", "subject_test.txt")
trainFeaturesFile <- file.path(filedir, "train", "X_train.txt")
trainActivityFile <- file.path(filedir, "train", "y_train.txt")
trainSubjectFile <- file.path(filedir, "train", "subject_train.txt"
                              )
## read in the data and merge the training and test sets

# get the column names from features file; use only the names
# and store it in a vector
columnNames <- read.table(featuresFile, 
                          stringsAsFactors = FALSE)[,2]

# Prepare to clean up the column names
cleanColumnNames <- gsub("^t", "Time", columnNames)
cleanColumnNames <- gsub("^f", "FFT", cleanColumnNames)
cleanColumnNames <- gsub("Acc", "Acceleration", cleanColumnNames)
#gsub("\\<([[:lower:]])", "\\U\\1", cleanColumnNames, perl = TRUE)
cleanColumnNames <- gsub("-([[:lower:]])", "\\U\\1", cleanColumnNames, perl=TRUE)
cleanColumnNames <- gsub("[[:punct:]]", "", cleanColumnNames)

# get the activity names and associated activity numbers ("ID" here)
activityNames <- read.table(activityNamesFile,col.names = c("ID", "Activity"))

# Read the features data
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
trainActDF <- read.table(trainActivityFile, col.names = "Activity")
trainActDF <- merge(activityNames, trainActDF, by.x="ID", by.y="Activity")
trainDF <- cbind(trainSubDF, trainActDF["Activity"], trainDF)

## Now do the same for test data
testDF <- read.table(testFeaturesFile, stringsAsFactors = FALSE,
                     col.names = columnNames)
names(testDF) <- cleanColumnNames
testDF<- testDF[,meanStdColIndex]
testSubDF <- read.table(testSubjectFile, col.names = "Subject")
testActDF <- read.table(testActivityFile, col.names = "Activity")
testActDF <- merge(activityNames, testActDF, by.x = "ID", by.y="Activity")
testDF <- cbind(testSubDF, testActDF["Activity"], testDF)

# now combine the two into one
DF <- rbind(trainDF, testDF)



# cleanup
rm(trainDF, testDF, trainSubDF, testSubDF, trainActDF, testActDF)

# find the average of each variable for each activity and each subject
# I chose the "wide" option here for the resultant table
library(dplyr)
# Tbl <- tbl_df(DF)
DF %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean, na.rm=TRUE) -> aggrTbl

# name the column names reflect that they are the average of something
for(i in 3:length(names(aggrTbl))) {
  names(aggrTbl)[i] <- paste0("Avg", names(aggrTbl)[i])
}

# write the result to a file in csv format
destFile = "output.csv"
write.csv(aggrTbl, destFile, quote = FALSE, row.names = FALSE)

