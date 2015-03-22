# Getting and Cleaning Data - Course Project#

#Packages Required#
library(data.table)
library(plyr)

#Pre Work#
# load required files into R
getwd() #check working Dir
# Make sure files loaded in working Dir#

# - Descriptive files #
Names = read.table("UCI HAR Dataset/features.txt",head=FALSE) # 561 column headings for the data
activity_label = read.table("UCI HAR Dataset/activity_labels.txt",header = FALSE) # Text labels for the activites

# - Core Raw data sets with observations #
x_test = read.table("UCI HAR Dataset/test/X_test.txt" ,header = FALSE)
x_train = read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
str(x_test) # chceck for 2947 rows - 30% data
str(x_train) # check for 7352 rows -  70% data

#Subjects who peformed tests#
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE)
str(subject_test)
str(subject_train)

# Activity Ref Files#
activity_test = read.table("UCI HAR Dataset/test/Y_test.txt",header = FALSE)  # ref flag for the Activity name
activity_train = read.table("UCI HAR Dataset/train/Y_train.txt",header = FALSE) # ref flag for the activity name

#Step 1 - Merge Training and Test data #
# Note - files loaded above # 

combined_data= rbind(x_test,x_train) #  merge core data#
names(combined_data)= Names[,2] # Apply the column names of the feature to the combined merged data set

combined_subject = rbind(subject_test,subject_train) # merge the subjects# 
names(combined_subject)=c("subject") #  add column name

combined_activity= rbind(activity_test,activity_train) # merge the activity ref.#
names(combined_activity)= c("activity_id")

Datafile=cbind(combined_data,combined_subject,combined_activity) # Merge the 3 elements togetehr
(str(Datafile))

#Step 2 

Checknames = Names[,2][grep("mean\\(\\)|std\\(\\)",Names[,2])] # 66 Columns with Mean/Std in title
extract_names =c(as.character(Checknames), "subject", "activity_id" ) # 66 from above plus Subject & activty columns

Datafile_ext=subset(Datafile,select=extract_names) # Data now subsetted for mean/std feature names
head(Datafile_ext)



##Step 3. Uses descriptive activity names to name the activities in the data set##

#add column names to activity labels#
names(activity_label)=c("activity_id","activity") # Creat column header on activity ref list

# Run join between Datafile_ext and Activity lables to apply lable name
Datafile_ext_1=join(Datafile_ext,activity_label,by = "activity_id", match = "first") 

#Step 4. Appropriately labels the data set with descriptive variable names. #

names(Datafile_ext_1)=gsub("([()])","",names(Datafile_ext_1))   # clean up var. names - rembve "()"
# Now Spell out Time and Frequency in the variable names
names(Datafile_ext_1)=gsub("^f", "frequency", names(Datafile_ext_1))
names(Datafile_ext_1)=gsub("^t", "time", names(Datafile_ext_1))

# Also spell out Accelerometer, Gyroscope and Magnitude #
names(Datafile_ext_1)=gsub("Acc", "Accelerometer", names(Datafile_ext_1))
names(Datafile_ext_1)=gsub("Gyro", "Gyroscope", names(Datafile_ext_1))
names(Datafile_ext_1)=gsub("Mag", "Magnitude", names(Datafile_ext_1))

#Remove "Body" and BodyBody" as follows - as they are common term that does not ADD to the description #
#From Codebook and readme files it is clear the meaurements relate to the Body
names(Datafile_ext_1)=gsub("BodyBody", "", names(Datafile_ext_1))
names(Datafile_ext_1)=gsub("Body", "", names(Datafile_ext_1))

#Step 5 . From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.#

Final=aggregate(Datafile_ext_1, by=list(Datafile_ext_1$subject,Datafile_ext_1$activity),FUN=mean) # Group by activty and subject, and apply the mean
names(Final)[1]=c("Subject_Group") # apply group names
names(Final)[2]=c("Activty_Group") # apply group names
str(Final)
getwd()
write.table(Final, file = "tidydataset.txt",row.name=FALSE)

## The End !!##
