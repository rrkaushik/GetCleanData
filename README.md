---
title: "README.md"
author: "Ram Kaushik"
date: "Wednesday, June 17, 2015"
output: html_document
---
#Summary:
The run_analysis.R script reads data from "test" and "training" datasets for a wearable computing experiment involving
30 people who performed six activities. Measurements made include angular velocities, accelerations etc.
The script combines data from multiple files, aggregates to find means and std deviations, and generates a tidy dataset with the following structure.
Subject, Activity, Quantity_mean_x, Quantity_mean_y etc.
The output dataset contains 180 rows and 68 columns.

# Source Data:
"Human Activity Recognition Using Smartphones Data Set"
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones describes the experiment in detail.

#Prerequisites:
Download the data and place the run_analysis.R script at the same level as the train and test directories.

#Pseudocode
* Write a function that takes file sub-directory name (e.g. test or train) and filename (e.g. x_train) and returns a data table.
* Reads the activity, x_test, subject_test & y_test files by calling the function
* Convert the activity to a name e.g. WALKING
* Repeat for the training data set
* Merges the training and the test sets to create one data set.
* Extracts mean and standard deviation columns for each measurement by using grep()
* Group the data by subject and activity using aggregate()
* Write the grouped dataset (tidy) to output file using write.table

