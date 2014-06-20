run_analysis.R README
2014 06 19 
=====================

Original Source of Data
-----------------------
Human Activity Recognition Using Smartphones Data Set
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 


Original Data Set Information:
------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and 
then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter 
with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain. 

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

run_analysis.R Data Preparation Description
===========================================

1. Data Set and Working Directory
---------------------------------
1a) The data set downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
is unzipped.
1b) run_analysis.R is to be placed in the "UCI HAR Dataset" directory. This is the working directory
1c) The "test" and "train" directories contain the testing set and training set respectively.

2. Data Processing
------------------
2a) The Subject ID (1-30), which represents the ID of the participants, are extracted from the testing set and training set:
- 2947 observations in training set extracted from "subject_train.txt" in "train" directory
- 7352 observations in testing set extracted from "subject_test.txt" in "test" directory
- These observations are merged into a 10,299 observation column vector labelled "SUBJECT"

2b) The Activities (1-6), which represents the activities performed by the subjects, are extracted from the testing set and training set:
- 2947 observations in training set extracted from "y_train.txt" in "train" directory
- 7352 observations in testing set extracted from "y_test.txt" in "test" directory
- These observations are merged into a 10,299 observation column vector labelled "ACTIVITIES"
- The values 1-6 are mapped into descriptive names defined in "activity_labels.txt" in working directory
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

2c) The measurements (561-feature vector) collected by the sensors are extracted from the testing set and training set:
- 2947 observations in training set extracted from "X_train.txt" in "train" directory
- 7352 observations in testing set extracted from "X_test.txt" in "test" directory
- The description of the 561 features are extracted from "features.txt" in working directory
- Only the features with names containing the string "mean" and "std" are retained, as they describes the mean and standard deviation of measurements.
- A total of 79 features per observation are retained.
- These are merged into a 10,299 observation tall, 79 features wide data frame, with column labels extracted from "features.txt"

2d) A tidy data frame is formed by column binding the observations from 2a), 2b) and 2c)
- The data frame has 10,299 observations as rows, and 81 columns.
- Col 1 is Subject ID, Col 2 is the Activities, and Col 3-81 are the 79 mean/std dev features
- Each observation represents the various sensor measurements collected when a particular subject is performing a particular activity.
- This data frame is written to a txt file (part1_df.txt) with two tabs (\t) as separators.
- To load this data frame back into R, use read.table("part1_df.txt") 

2e) Another tidy data frame is formed by taking the average of each measurement in 2d) for each subject and each activities
- The data frame has 180 observations as rows, and 81 columns.
- Col 1 is Subject ID and Col 2 the Activities, and Col 3-81 now represents the average of the 79 mean/std dev features
- The 180 observations consist of average features from the 30 subjects * 6 activities per subject
- Each observation therefore represents the averages of the measurements when a particular subject is performing a particular activity.
- This data frame is written to a txt file (result.txt) with two tabs (\t) as separators.
- To load this data frame back into R, use read.table("result.txt") 
