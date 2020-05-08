---
title: "README.md"
author: "morbosad"
date: "5/8/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# README

## Smartphone Dataset Averages

The data in this data set is derived from data at the UC Irvine
Machine Learning Repository
from Samsung Galaxy S smartphones worn by volunteer test subjects.
A full description is availabe at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

This data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

The original experiments were carried out with a group of 30 volunteers. Each
volunteer perfored one of six activities (see CodeBook) wearing a smartphone.

This dataset takes contains the averages of each mean or standard deviation (std)
variable/column in the original dataset, grouped by subject and activity (e.g., for
Subject 1 in the original dataset, there are 347 rows for the activity walking.
This dataset contains the average of those 347 rows for all the mean and std
variables).

## run_analysis.R

The run_analysis.R script is an R script that produces the output dataset.
It requires the "dplyr" package, which may be install via

```
install.packages("dplyr")
```

The run_analysis.R script must be run in a
directory containing the unziped data obtained from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unziping the file should produce directory "UCI HAR Dataset", which
contains the original descriptions of the data, as well as two subdirectories
containing the test and training datasets.

The script will produce as output a file called "data_averages.txt" contained the 
data.

The file may be read into an R script using code such as

```
df <- read.table("data_averages.txt", header = TRUE)
```


