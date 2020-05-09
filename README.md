---
title: "README"
author: "morbosad"
date: "5/8/2020"
output: html_document
---

## Smartphone Dataset Averages

The data in this data set is derived from data at the UC Irvine
Machine Learning Repository
from Samsung Galaxy S smartphones worn by volunteer test subjects.
A full description is availabe at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

This data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The original experiments were carried out with a group of 30 volunteers. Each
volunteer perfored one of six activities (see CodeBook) wearing a smartphone.

This dataset takes contains the averages of each mean or standard deviation (std)
variable/column in the original dataset, grouped by subject and activity (e.g., for
Subject 1 in the original dataset, there are 347 rows for the activity walking.
This dataset contains the average of those 347 rows for all the mean and std
variables).

See CodeBook.md for a detailed description of the data.

## run_analysis.R

The run_analysis.R script is an R script that produces the output dataset.
It requires the "dplyr" package, which may be install via

```
install.packages("dplyr")
```

This script

1. Downloads the dataset from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) if the zip file does not already exist in the working directory
2. Unzips the file to produce directory "UCI HAR Dataset"
3. Merges training and test sets to create one data set
4. Extracts only measurements on mean and std dev for each variable
5. Applies descriptive activity names to the activities (SITTING, etc.)
6. Labels the dataset variables/columns
7. Creates a new, independent data set with avg of each variable grouped by activity and subject
8. Writes the new dataset as output to a file called "data_averages.txt"

The output file may be read into an R script using code such as

```
read.table("data_averages.txt", header = TRUE)
```


