==================================================================
Codebook for Modified Dataset showing
Average of sensor signal variables for different activities for each subject

from Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit� degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

BACKGROUND OF EXPERIMENT AND ORIGINAL DATASET
---------------------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

HOW THE SIGNALS ARE COLLECTED
-----------------------------

Time domain signals, captured at a constant rate of 50 Hz, are filtered using a median filter and a 3rd orderlow pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise.

Acceleration signal was separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].


MODIFICATIONS TO THE ORIGINAL DATASET (See also README.MD for detailed description)
-------------------------------------
1. Training data and test data from the original dataset are combined, together with the associated subject identifier and activities type
2. Only the feature columns which contains mean and standard deviation of measurements are retained.
3. Average of the features for each subject and each activity is determined and presented in the modified dataset.


CODEBOOK FOR VARIABLES IN DATASET
---------------------------------
SUBJECT
- An identifier (1-30) of the subject who carried out the experiment.

ACTIVITIES
- One of the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by the subject

"Feature variables" (Total of 79 features)
- Represents the average value for each subject and for each activity

"Avg_tBodyAcc-mean()-X"               
"Avg_tBodyAcc-mean()-Y"              
"Avg_tBodyAcc-mean()-Z"                
"Avg_tBodyAcc-std()-X"               
"Avg_tBodyAcc-std()-Y"                
"Avg_tBodyAcc-std()-Z"
- Represents the average of mean and standard deviation of time-domain body acceleration signals in X,Y,Z axis.
- Units: standard gravity units 'g'

"Avg_tGravityAcc-mean()-X"            
"Avg_tGravityAcc-mean()-Y"           
"Avg_tGravityAcc-mean()-Z"            
"Avg_tGravityAcc-std()-X"            
"Avg_tGravityAcc-std()-Y"             
"Avg_tGravityAcc-std()-Z"  
- Represents the average of mean and standard deviation of time-domain gravity acceleration signals in X,Y,Z axis.
- Units: standard gravity units 'g'
      
"Avg_tBodyAccJerk-mean()-X"           
"Avg_tBodyAccJerk-mean()-Y"          
"Avg_tBodyAccJerk-mean()-Z"          
"Avg_tBodyAccJerk-std()-X"           
"Avg_tBodyAccJerk-std()-Y"            
"Avg_tBodyAccJerk-std()-Z" 
- Represents the average of mean and standard deviation of time-domain body linear acceleration signals (Jerk signals) in X,Y,Z axis.
- Units: g/s

"Avg_tBodyGyro-mean()-X"              
"Avg_tBodyGyro-mean()-Y"             
"Avg_tBodyGyro-mean()-Z"              
"Avg_tBodyGyro-std()-X"              
"Avg_tBodyGyro-std()-Y"               
"Avg_tBodyGyro-std()-Z"
- Represents the average of mean and standard deviation of time-domain angular velocity signals in X,Y,Z axis.
- Units: rad/s
            
"Avg_tBodyGyroJerk-mean()-X"          
"Avg_tBodyGyroJerk-mean()-Y"         
"Avg_tBodyGyroJerk-mean()-Z"          
"Avg_tBodyGyroJerk-std()-X"          
"Avg_tBodyGyroJerk-std()-Y"          
"Avg_tBodyGyroJerk-std()-Z"
- Represents the average of mean and standard deviation of time-domain angular velocity Jerk signals in X,Y,Z axis.
- Units: rad/s^2  

"Avg_tBodyAccMag-mean()"              
"Avg_tBodyAccMag-std()"              
"Avg_tGravityAccMag-mean()"           
"Avg_tGravityAccMag-std()"           
"Avg_tBodyAccJerkMag-mean()"          
"Avg_tBodyAccJerkMag-std()"  
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit: g

"Avg_tBodyGyroMag-mean()"             
"Avg_tBodyGyroMag-std()"             
"Avg_tBodyGyroJerkMag-mean()"         
"Avg_tBodyGyroJerkMag-std()"         
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit: rad/s

"Avg_fBodyAcc-mean()-X"               
"Avg_fBodyAcc-mean()-Y"              
"Avg_fBodyAcc-mean()-Z"              
"Avg_fBodyAcc-std()-X"               
"Avg_fBodyAcc-std()-Y"                
"Avg_fBodyAcc-std()-Z" 
- Represents the average of mean and standard deviation of frequency-domain body acceleration signals in X,Y,Z axis.
- Unit: g

"Avg_fBodyAcc-meanFreq()-X"           
"Avg_fBodyAcc-meanFreq()-Y"          
"Avg_fBodyAcc-meanFreq()-Z"
- Represents the average of the Weighted average of the respective frequency components in X,Y,Z axis.
- Unit: g
           
"Avg_fBodyAccJerk-mean()-X"          
"Avg_fBodyAccJerk-mean()-Y"           
"Avg_fBodyAccJerk-mean()-Z" 
"Avg_fBodyAccJerk-std()-X"            
"Avg_fBodyAccJerk-std()-Y"           
"Avg_fBodyAccJerk-std()-Z"            
- Represents the average of mean and standard deviation of frequency-domain body linear acceleration signals (Jerk signals) in X,Y,Z axis.
- Unit: g

"Avg_fBodyAccJerk-meanFreq()-X" 
"Avg_fBodyAccJerk-meanFreq()-Y"       
"Avg_fBodyAccJerk-meanFreq()-Z" 
- Represents the average of the Weighted average of the respective frequency components in X,Y,Z axis.
- Unit: g/s

"Avg_fBodyGyro-mean()-X"              
"Avg_fBodyGyro-mean()-Y"             
"Avg_fBodyGyro-mean()-Z"              
"Avg_fBodyGyro-std()-X"              
"Avg_fBodyGyro-std()-Y"               
"Avg_fBodyGyro-std()-Z"
- Represents the average of mean and standard deviation of frequency-domain angular velocity signals in X,Y,Z axis.
- Unit: rad/s
              
"Avg_fBodyGyro-meanFreq()-X"          
"Avg_fBodyGyro-meanFreq()-Y"         
"Avg_fBodyGyro-meanFreq()-Z"          
- Represents the average of the Weighted average of the respective frequency components in X,Y,Z axis.
- Unit: rad/s

"Avg_fBodyAccMag-mean()"             
"Avg_fBodyAccMag-std()"               
"Avg_fBodyAccMag-meanFreq()"
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit: g
         
"Avg_fBodyBodyAccJerkMag-mean()"      
"Avg_fBodyBodyAccJerkMag-std()"      
"Avg_fBodyBodyAccJerkMag-meanFreq()"
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit: g/s
  
"Avg_fBodyBodyGyroMag-mean()"        
"Avg_fBodyBodyGyroMag-std()"          
"Avg_fBodyBodyGyroMag-meanFreq()"
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit:rad/s
    
"Avg_fBodyBodyGyroJerkMag-mean()"     
"Avg_fBodyBodyGyroJerkMag-std()"     
"Avg_fBodyBodyGyroJerkMag-meanFreq()"
- Represents the average of mean and standard deviation of the Magnitude of the respective signals
- Unit: rad/s^2

