Course Project - Code Book

### Data Set Information Overview : ###

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**# ## Files Available : ## #**

The following files contain the elements of the datasets.

- features_info.txt: Shows information about the variables used on the feature vector.
- features.txt: List of all features.
- activity_labels.txt: Links the class labels with their activity name.
- train/X_train.txt': Training set.
- train/y_train.txt': Training labels
- Test/X_test.txt': Test set
- test/y_test.txt': Test labels.

**Units **: As noted, the original Features are normalized and bounded within [-1,1].

## Final Tidy Data Set ##

The readme.md file in the Repo provides a step by step guide on how the original data set was processed to arrive at the final tidy data set.(see this for processing reference)

Variable Names : The features.txt file provides a list of all variables, where the format is as follows.

- tBodyAcc-correlation()-Y,Z
- tGravityAcc-mean()-X

The short hand notations mean the following in relation to the measurements :

- t - stands for time
- f - stands for frequency
- Acc - stands for Accelerometer
- Gyro - stands for Gyroscope
- Mag - stands for Magnitude
- X/Y/Z - one direction of a 3-axial signal

Further details are available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)




