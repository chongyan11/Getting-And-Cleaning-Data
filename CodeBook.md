# CodeBook.md
Describes everything which was done in this project
##### Retrieves data from original dataset and loads them into R.
  - `features` <- features.txt : The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
  - `activities` <- activity_labels.txt : List of activities performed when the corresponding measurements were taken and its codes (labels)
  - `subject_test` <- test/subject_test.txt : contains test data of 9/30 volunteer test subjects being observed
  - `x_test` <- test/X_test.txt : contains recorded features test data
  - `y_test` <- test/y_test.txt : contains test data of activities’code labels
  - `subject_train` <- test/subject_train.txt : contains train data of 21/30 volunteer subjects being observed
  - `x_train` <- test/X_train.txt : contains recorded features train data
  - `y_train` <- test/y_train.txt : contains train data of activities’code labels
##### Merges Training and Test Datasets
  - `rbind()` test and training sets for each of the 3 types of data: subject, x, y
  - `cbind()` the variables that result : result assigned to variable `combined`
##### Extracts only data for mean and standard deviation measurements
  - Searches through names of each column using `grep` to find either "mean" or "std", returns vector containing column indices
  - Uses `select` to collect the columns that are required : result assigned to variable `extract`
##### Names and labels extracted dataset appropriately
  - Substitutes abbreviated labels to tidy the names using `gsub`
  - e.g. t -> Time; f -> Freq
  - e.g. Acc -> Accelerometer; Gyro -> Gyroscope; Mag -> Magnitude
##### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - Grouped data according to subject and activity using `group_by`
  - Used `summarise_all` to apply the `mean` function across all columns
  - Assigned result to variable `summary`
  - `summary` was written to `TidyData.txt`
