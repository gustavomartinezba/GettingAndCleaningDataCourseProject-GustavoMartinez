## We read the tables (which are saved as txt files) using <<- instead of <- so 
## that the dataframes go to the global environment.

activity_labels <<- read.table("UCI HAR Dataset/activity_labels.txt")
features <<- read.table("UCI HAR Dataset/features.txt", 
                        stringsAsFactors = FALSE)
subject_test <<- read.table("UCI HAR Dataset//test/subject_test.txt")
x_test <<- read.table("UCI HAR Dataset//test/X_test.txt")
y_test <<- read.table("UCI HAR Dataset//test/y_test.txt")
subject_train <<- read.table("UCI HAR Dataset//train/subject_train.txt")
x_train <<- read.table("UCI HAR Dataset//train/X_train.txt")
y_train <<- read.table("UCI HAR Dataset//train/y_train.txt") 