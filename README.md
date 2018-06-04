# GettingAndCleaningDataCourseProject-GustavoMartinez

This is my project for the course Getting and Cleaning Data of the John Hopkings University online (Coursera) Data Science specialization. 

The bulk of the work is done by the script run_analysis.R, where the five steps given in the instructions are detailed and performed. Besides, for the sake of readability, two other scripts are sourced to perform tasks which are less relevant to this course:
* get_files.R downloads the file from the url given in the instructions and unzips it in the working directory.
* read_files.R reads, as data frames, the tables needed for the assignment and saves them in the global environment. 

## Notes on each step

### Step 1

(Instruction: Merges the training and the test sets to create one data set.)

The reason for putting the activities column (y_test and y_train) before the subjects (subject_test and subject_train) is looking ahead to step 5, where the grouping is done by activity and then subject.

### Step 2

(Instruction: Extracts only the measurements on the mean and standard deviation for each measurement.)

I selected only those features containing the string "mean()" or "std()". This excludes 20 variables that would've been selected if "mean" or "Mean" were accepted. The reason for excluding them is that:
* 7 of those variables are like, e.g. "angle(tBodyAccMean,gravity)", which is really an angle, not a mean per se.
* the other 13 are like, e.g. "fBodyAcc-meanFreq()-X". Since meanFreq() gives the "weighted average of the frequency components", i.e. almost a usual mean but not quite, I chose to exclude them.

### Step 3

(Instruction: Uses descriptive activity names to name the activities in the data set.)

I made use here of "activity_labels.txt", editing the text a bit to make it nicer.

### Step 4

(Instructions: Appropriately labels the data set with descriptive variable names.) 

As above, here I used what was given ("features.txt"). To keep the names short I left them almost as they were in raw (removing superfluous characters); they can be easily understood from the original description (from "features_info.txt), which I included in the Code Book with appropiate but minimal modifications. For readability I left the [Camel Case](https://en.wikipedia.org/wiki/Camel_case) just as it was.

### Step 5

(Instructions: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.)

This could be unsderstood in two manners:
* To select those columns with "mean" in them.
* To summarize each (feature) column using the "mean" function after grouping by activity and subject.

I chose the second since the result is a smaller (nicer) data set. This produces, in fact, "means of means" and "means of standard deviations", but I see no reason why those wouldn't be interesting for an analysis. 
