# Getting and Cleaning Data - Final Course Project

This is the final course project for the Getting and Cleaning Data Coursera course. 
In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

* README.md - provides an overview of the data set and how it was created;
* tidy_data.txt - contains the data set;
* Codebook.md - describes the content of the data set
* run_analysis.R - the R script used to create the data set 
    
# Study design

The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected.
Creation of the Data Set:
The R script, run_analysis.R, does the following:
Download and unzip the dataset if it does not already exist in the working directory
Read the data
Merge the training and the test sets to create one data set.
Extract only the measurements on the mean and standard deviation for each measurement.
Use descriptive activity names to name the activities in the data set.
Appropriately label the data set with descriptive variable names.
Create a second, independent tidy set with the average of each variable for each activity and each subject.
Write the data set to the tidy_data.txt file.

The end result is shown in the file tidy_data.txt.