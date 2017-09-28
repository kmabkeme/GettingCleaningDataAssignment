Code Book for Human Activity Recognition for Smartphones Dataset

This code book accompanies some code that processes the data from Human Activity Recognition Using Smartphones Dataset Version 1.0. Description of the research that gathered the data is located here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The scripts contained here in the file run_analysis.R included as part of this package read in measurements taken on a set of 30 volunteers who wore a smartphone (Samsung Galaxy S II) around the waist while performing each of six different activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying (which actually is properly called “lying down”). The accelerometer and gyroscope embedded in the smartphone generated data on linear acceleration and angular velocity that were saved in three dimensions (that is, broken into the x-axis, y-axis, and z-axis components).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low-pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body (tBodyAcc-XYZ) and gravity acceleration signals (tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The leading “t” in the measurement name indicates that this was conducted in the time domain, in terms of the unit g, where g is the gravity of Earth (9.80665 meter per second per second). 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ), meaning the signals due to a sudden, sharp movement (a “jerking” motion). Also the magnitudes of all of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). The Euclidean norm is the square root of the sum of the squares of each orthogonal component of the vector (i.e., think of the Pythagorean theorem for calculating the length of the hypotenuse based on the lengths of the legs, applied to three dimensions). 

The measurements with a leading “f” are those which resulted from having a Fast Fourier Transform (FFT) applied to original time-domain signals. These produced fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals, which have units of Hertz = 1/second). 

This assignment called for extracting only those measurements that contained the mean and the standard deviation for each motion component that was being measured. So, angular

Measurement label					Meaning (taken on all measurements for a subject performing a specific activity)
(Mean/Std = mean/standard deviation)		Note that each measurement with “_Mean” after the label means that several sets of
							measurements for the same subject performing a single activity have been averaged							so the final result is the mean of mean values.

tBodyAcc(Mean/Std)X_Mean			(mean/standard deviation) of the body linear acceleration along the X-axis (units of g)
tBodyAcc(Mean/Std)Y_Mean			(mean/standard deviation) of the body linear acceleration along the Y-axis (units of g)
tBodyAcc(Mean/Std)Z_Mean			(mean/standard deviation) of the body linear acceleration along the Z-axis (units of g)
tGravityAcc(Mean/Std)X_Mean 			(mean/standard deviation) of the gravity acceleration along the X-axis (units of g)
tGravityAcc(Mean/Std)Y_Mean 			(mean/standard deviation) of the gravity acceleration along the Y-axis (units of g)
tGravityAcc(Mean/Std)Z_Mean			(mean/standard deviation) of the gravity acceleration along the Z-axis (units of g)
tBodyAccJerk(Mean/Std)X_Mean 		(mean/standard deviation) of the body linear acceleration along the X-axis for jerk motion (units of g)
tBodyAccJerk(Mean/Std)Y_Mean 		(mean/standard deviation) of the body linear acceleration along the Y-axis for jerk motion (units of g)
tBodyAccJerk(Mean/Std)Z_Mean 		(mean/standard deviation) of the the body linear acceleration along the Z-axis for jerk motion (units of g)
tBodyGyro(Mean/Std)X_Mean			(mean/standard deviation) of the body angular velocity along the X-axis (units of radians/second)
tBodyGyro(Mean/Std)Y_Mean 			(mean/standard deviation) of the body angular velocity along the Y-axis (units of radians/second)
tBodyGyro(Mean/Std)Z_Mean 			(mean/standard deviation) of the body angular velocity along the Z-axis (units of radians/second)
tBodyGyroJerk(Mean/Std)X_Mean		(mean/standard deviation) of the body angular velocity along the X-axis for jerk motion (units of radians/second)
tBodyGyroJerk(Mean/Std)Y_Mean		(mean/standard deviation) of the body angular velocity along the Y-axis for jerk motion (units of radians/second)
tBodyGyroJerk(Mean/Std)Z_Mean		(mean/standard deviation) of the body angular velocity along the Z-axis for jerk motion (units of radians/second)
tBodyAccMag(Mean/Std)_Mean			(mean/standard deviation) magnitude of the body linear acceleration calculated using the Euclidean norm (units of g)
tGravityAccMag(Mean/Std)_Mean		(mean/standard deviation) magnitude of the gravity acceleration calculated using the Euclidean norm (units of g)
tBodyAccJerkMag(Mean/Std)_Mean 		(mean/standard deviation) magnitude of the body linear acceleration for jerk motion calculated using the Euclidean norm (units of g)
tBodyGyroMag(Mean/Std)_Mean			(mean/standard deviation) magnitude of the body angular velocity calculated using the Euclidean norm (units of radians/second)
tBodyGyroJerkMag(Mean/Std)_Mean		(mean/standard deviation) magnitude of the body angular velocity for jerk motion calculated using the Euclidean norm (units of radians/second)
fBodyAcc(Mean/Std)X_Mean			(mean/standard deviation) of the FFT of the body linear acceleration along the X-axis (units of Hz)
fBodyAcc(Mean/Std)Y_Mean			(mean/standard deviation) of the FFT of the body linear acceleration along the Y-axis (units of Hz)
fBodyAcc(Mean/Std)Z_Mean 			(mean/standard deviation) of the FFT of the body linear acceleration along the Z-axis (units of Hz)
fBodyAccJerk(Mean/Std)X_Mean			(mean/standard deviation) of the FFT of the body linear acceleration along the X-axis for jerk motion (units of Hz)
fBodyAccJerk(Mean/Std)Y_Mean 		(mean/standard deviation) of the FFT of the body linear acceleration along the Y-axis for jerk motion (units of Hz)
fBodyAccJerk(Mean/Std)Z_Mean			(mean/standard deviation) of the FFT of the body linear acceleration along the Z-axis for jerk motion (units of Hz)
fBodyGyro(Mean/Std)X_Mean 			(mean/standard deviation) of the FFT of the body angular velocity along the X-axis (units of Hz)
fBodyGyro(Mean/Std)Y_Mean			(mean/standard deviation) of the FFT of the body angular velocity along the Y-axis (units of Hz)
fBodyGyro(Mean/Std)Z_Mean			(mean/standard deviation) of the FFT of the body angular velocity along the Z-axis (units of Hz)
fBodyAccMag(Mean/Std)_Mean			(mean/standard deviation) of the FFT of the body linear acceleration calculated using the Euclidean norm (units of Hz)
fBodyBodyAccJerkMag(Mean/Std)_Mean 	(mean/standard deviation) of the FFT of the body linear acceleration for jerk motion calculated using the Euclidean norm (units of Hz)
fBodyBodyGyroMag(Mean/Std)_Mean		(mean/standard deviation) of the FFT of the body angular velocity calculated using the Euclidean norm (units of Hz)
fBodyBodyGyroJerkMag(Mean/Std)_Mean 	(mean/standard deviation) of the FFT of the body angular velocity for jerk motion calculated using the Euclidean norm (units of Hz)
