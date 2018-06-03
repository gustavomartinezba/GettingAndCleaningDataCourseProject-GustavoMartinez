get_files <- function() {
      url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(url, "project_files.zip")
      unzip("project_files.zip")  
}