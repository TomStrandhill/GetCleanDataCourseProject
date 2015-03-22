# GetCleanDataCourseProject
Getting and Cleaning Data - Course Project Repo

This Readme file describes the source of the data used in the analysis, how the data was processed and any transformations performed - in arriving at the outcome of a Tidy Data Set out in step 5 below.

The raw data is found at the following location :
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Data Source")

The Codebook assoicated with this project provide information in  relation to the data variable and structure - which are therefore not covered here.

Additional Suammry Information on the Project data set and its source is found here :
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Suammry Information")

## Files Used in the Analysis ##
Original zip folder : UCI HAR Dataset ("Docs")

The readme.txt file within Docs explains the various files in the zip folders and which are relevant to this projects.
 - The relevant folders and file are as follows, and these files should be placed into the working Dir for use with the scripts
 - There are other files in the unzipped package which can be ignored

(note: "L" indicates that the file will be loaded in R as part of the process)

Folder : Test

-   subject_test.txt	(L)
-   x_test.txt		(L)
-   y_test.txt	(L)

Folder : Train

- subject_train.txt	(L)
- x_train.txt (L)
- y_train.txt	(L)

Folders :  Root

- activity_labels (L)
- features (L)
- features_info
- README


----------
##  ##The following steps and process was use in the preparing the data set, based on the Course Project Guidelines

**Project Instructions**


- 1. Merges the training and the test sets to create one data set.
- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3. Uses descriptive activity names to name the activities in the data set
- 4. Appropriately labels the data set with descriptive variable names. 
- 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

----------

**Pre work : Load all the files,tagged with L above, into R.

----------

**Step 1: Merge train and test data sets.**

3 elements are required to be combined to complete the data tables for both the training and test date sets.

These 3 elements are :
*1. data observations / 2. activity references / 3. subject references

**Merge each of these for the training and test data sets**

- 1.Merge the train and test datasets for each of these 3 elements.
- 2. Add the column names for each of these 3 elements
- 2.1 - Column names for the data observations come from the "features.txt" file, with the subject & activity names applied manually
- 3. All 3 elements are now combined to arrive at full data set, with column names, and the subject & activity references applied.

**Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. **

Use grep function in R to check which feature names have "mean" or "Std" in title.
 - This gives 66 columns
Now add the "subject" and "activity" column names to these 66, to arrive at final list of column we want to extract
Subset main data set - based on this list of columns.

**Step 3 : Uses descriptive activity names to name the activities in the data set**

The descriptive activity labels are found in the "activity_labels" file, where column 1 is the numerical reference to the "text" label in column 2.

The main data set (Datafile_ext) has the same numerical reference in the "Activity_id" column.

Run JOIN on these to table to apply the descriptive text name to the activity.

**Step 4. Appropriately labels the data set with descriptive variable names**

To develop more descriptive variable names we can do the following.

- As described in the original readme file, the variable are either time or frequency base, where "t" and "f" are used in the current variable names.
- We can replace "t" with "Time." and "f" with "frequency."
-Similiar changes are made for the Accelerometer, Gyroscope and Magnitude abbreviations

**Step 5 . From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**.


