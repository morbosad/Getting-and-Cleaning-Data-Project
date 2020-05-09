---
title: "CodeBook"
author: "morbosad"
date: "5/7/2020"
output: html_document
---

## Data Codebook

### Derivation of Data

The dataset in `data_averages.txt` is produced by running the run_analysis.R

The script requires the 'dplyr' package, which may be installed via
```
install.packages("dplyr"")
```

See the README for more information on running the script.

### Feature Data

The data in this dataset is derived from data at the UC Irvine
Machine Learning Repository
from Samsung Galaxy S smartphones worn by volunteer test subjects.
A full description is availabe at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

This data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

This dataset is a subset of the original, using only the 'mean' and
'std' (standard deviation) variables from the original (it does *not*
use the gravityMean and meanFreq variables). Each variable
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
  + integer: the ID of the test subject
* Activity
  + character string: the activity performed when measurements where taken. One of:
  + WALKING
  + WALKING_UPSTAIRS
  + WALKING_DOWNSTAIRS
  + SITTING
  + STANDING
  + LAYING
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
