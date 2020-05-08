---
title: "CodeBook.md"
author: "morbosad"
date: "5/7/2020"
output: html_document
---

## Data Codebook

### Derivation of Data

The dataset here is produced by running the run_analysis.R script in a
directory containing the unziped data obtained from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unziping the file should produce directory "UCI HAR Dataset", which
contains the original descriptions of the data, as well as two subdirectories
containing the test and training datasets. 

The script requires the 'dplyr' package, which may be installed via
```
install.packages("dplyr"")
```

### Feature Data

The data in this dataset is derived from data at the UC Irvine
Machine Learning Repository
from Samsung Galaxy S smartphones worn by volunteer test subjects.
A full description is availabe at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

This data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

This dataset is a subset of the original, using only the 'mean' and
'std' (standard deviation) variables from the original. Each variable
is the average of the corresponding variable for each subject and
activity of both the test and training datasets.
In other words, each each row contains the average of the
feature data for one of the six activities for one subject.

The feature values were normalized in the original dataset and are
between -1.0 and 1.0; therefore, the averages in this dataset are
also between 1.0 and 1.0.

The code book for the original dataset describes the variables as follows:

> [T]he body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of tThe features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
he feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The variable names in this dataset were renamed slightly for clarity: 't'
was changed to 'Time', 'f' to "FFT"" (Fast Fourier Transform), and "Acc" was
expanded to "Acceleration". Punctuation was also removed from the variable names.

## Description of columns

The first two columns identify the Subject and Activity. The remaining
columns are real numbers between -1.0 and 1.0 that are the averages of the
"feature" variables in the original dataset.

* Subject
  + integer: subject id
* Activity
  + string: one of six activity names
  + 1 WALKING
  + 2 WALKING_UPSTAIRS
  + 3 WALKING_DOWNSTAIRS
  + 4 SITTING
  + 5 STANDING
  + 6 LAYING
* AvgTimeBodyAccelerationMeanX
* AvgTimeBodyAccelerationMeanY
* AvgTimeBodyAccelerationMeanZ
* AvgTimeBodyAccelerationStdX
* AvgTimeBodyAccelerationStdY
* AvgTimeBodyAccelerationStdZ
* AvgTimeGravityAccelerationMeanX
* AvgTimeGravityAccelerationMeanY
* AvgTimeGravityAccelerationMeanZ
* AvgTimeGravityAccelerationStdX
* AvgTimeGravityAccelerationStdY
* AvgTimeGravityAccelerationStdZ
* AvgTimeBodyAccelerationJerkMeanX
* AvgTimeBodyAccelerationJerkMeanY
* AvgTimeBodyAccelerationJerkMeanZ
* AvgTimeBodyAccelerationJerkStdX
* AvgTimeBodyAccelerationJerkStdY
* AvgTimeBodyAccelerationJerkStdZ
* AvgTimeBodyGyroMeanX
* AvgTimeBodyGyroMeanY
* AvgTimeBodyGyroMeanZ
* AvgTimeBodyGyroStdX
* AvgTimeBodyGyroStdY
* AvgTimeBodyGyroStdZ
* AvgTimeBodyGyroJerkMeanX
* AvgTimeBodyGyroJerkMeanY
* AvgTimeBodyGyroJerkMeanZ
* AvgTimeBodyGyroJerkStdX
* AvgTimeBodyGyroJerkStdY
* AvgTimeBodyGyroJerkStdZ
* AvgTimeBodyAccelerationMagMean
* AvgTimeBodyAccelerationMagStd
* AvgTimeGravityAccelerationMagMean
* AvgTimeGravityAccelerationMagStd
* AvgTimeBodyAccelerationJerkMagMean
* AvgTimeBodyAccelerationJerkMagStd
* AvgTimeBodyGyroMagMean
* AvgTimeBodyGyroMagStd
* AvgTimeBodyGyroJerkMagMean
* AvgTimeBodyGyroJerkMagStd
* AvgFFTBodyAccelerationMeanX
* AvgFFTBodyAccelerationMeanY
* AvgFFTBodyAccelerationMeanZ
* AvgFFTBodyAccelerationStdX
* AvgFFTBodyAccelerationStdY
* AvgFFTBodyAccelerationStdZ
* AvgFFTBodyAccelerationJerkMeanX
* AvgFFTBodyAccelerationJerkMeanY
* AvgFFTBodyAccelerationJerkMeanZ
* AvgFFTBodyAccelerationJerkStdX
* AvgFFTBodyAccelerationJerkStdY
* AvgFFTBodyAccelerationJerkStdZ
* AvgFFTBodyGyroMeanX
* AvgFFTBodyGyroMeanY
* AvgFFTBodyGyroMeanZ
* AvgFFTBodyGyroStdX
* AvgFFTBodyGyroStdY
* AvgFFTBodyGyroStdZ
* AvgFFTBodyAccelerationMagMean
* AvgFFTBodyAccelerationMagStd
* AvgFFTBodyBodyAccelerationJerkMagMean
* AvgFFTBodyBodyAccelerationJerkMagStd
* AvgFFTBodyBodyGyroMagMean
* AvgFFTBodyBodyGyroMagStd
* AvgFFTBodyBodyGyroJerkMagMean
* AvgFFTBodyBodyGyroJerkMagStd

make a link like this: <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
