## Get the files:
source("get_files.R") 

## Read the files (tables):
source("read_files.R")

## STEP 1: Merge the training and test tables (with activity (y) and subject 
## columns included):
merge <- rbind(cbind(y_test, subject_test, x_test), 
               cbind(y_train, subject_train, x_train))

## STEP 2: Extract only the mean and standard deviation for each measurement:
sel <- grep("mean\\(\\)|std\\(\\)", features$V2)
selmerge <- merge[, c(1, 2, sel + 2)]

## STEP 3: Use descriptive names for the activities:
activity_labels$V2 <- tolower(activity_labels$V2)
activity_labels$V2 <- sub("_", " ", activity_labels$V2)
which_activity <- function(x) {activity_labels[x, 2]}
selmerge[, 1] <- sapply(selmerge[, 1], which_activity)

## STEP 4: Label (name) the variables descriptively:
features$V2 <- sub("\\(\\)", "", features$V2)
features$V2 <- gsub("-", "", features$V2)
features$V2 <- sub("mean", "Mean", features$V2)
features$V2 <- sub("std", "Std", features$V2)
feature_names <- features[sel, 2]
names(selmerge) <- c("activity", "subject", feature_names)

## STEP 5: Create another (tidy) data set with the average of each variable for 
## each activity and each subject and save it as txt file:
library(dplyr)
sol <- selmerge %>% group_by(activity, subject) %>% summarize_all(mean)
write.table(sol, file = "TidyDataSet.txt", row.names = FALSE)
