run_analysis <- function() {
  ## Reading data from datasets provided
  features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("n", "Feature"))
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("Label", "Activity Name"))
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "Subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$Feature)
  y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE, col.names = "Label")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "Subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$Feature)
  y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE, col.names = "Label")
  # print(ls())

  ## Merging data from training and test sets
  x <- rbind(x_train, x_test)
  y <- rbind(y_train, y_test)
  subject <- rbind(subject_train, subject_test)
  combined <- cbind(subject, x, y)
  # View(combined)
  
  ## Selecting only data containing mean and standard deviation
  mean_std_col <- grep(("mean|std"), names(combined))
  # print(mean_std_col)
  library(dplyr)
  extract <- select(combined, Subject, Label, mean_std_col)
  # View(extract)
  
  ## Naming activities in data set
  extract$Label <- activity_labels[extract$Label, 2]
  names(extract) <- gsub("^t", "Time", names(extract))
  names(extract) <- gsub("^f", "Freq", names(extract))
  names(extract) <- gsub("Gyro", "Gyroscope", names(extract))
  names(extract) <- gsub("Acc", "Accelerometer", names(extract))
  names(extract) <- gsub("-mean()", "Mean", names(extract))
  names(extract) <- gsub("-freq()", "Freq", names(extract))
  names(extract) <- gsub("Mag", "Magnitude", names(extract))
  names(extract)[2] <- "Activity"
  
  ## Creating average by activity and subject
  summary <- extract %>%
    group_by(Subject, Activity) %>%
    summarize_all(mean)
  write.table(summary, "TidyData.txt")
  # View(summary)
}