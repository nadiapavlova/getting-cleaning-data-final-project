# Clean up workspace
rm(list=ls())

# Create the directory and unzip the file

if(!file.exists("data")) {dir.create("data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/finalproject.zip")
unzip(zipfile = "./data/finalproject.zip",exdir = "./data")

# Read the data from the training tables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature table
features <- read.table("./data/UCI HAR Dataset/features.txt")

# Reading activity labels table
activity_type <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Assigin column names to the training data imported above
colnames(activity_type) <- c('activityid','activity_type')
colnames(subject_train) <- "subjectid"
colnames(x_train) <- features[,2] 
colnames(y_train) <- "activityid"

# Assign column names to the test data imported above
colnames(subject_test) <- "subjectid"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityid"

# Create the final training set by merging y_rain, subject_train, and x_train tables
training <- cbind(y_train,subject_train,x_train)

# Create the final test set by merging the x_test, y_test and subject_test data tables
test <- cbind(y_test,subject_test,x_test)

# Combine training and test data tables to create a final data set
final <- rbind(training,test)

# Read the column names:
col_names <- colnames(final) 

# Create a logical vector to xtract only the measurements on the mean and standard deviations for each measurement

logic_vector <- grepl("subject|activity|mean|std", colnames(final))

# Subset the final data table based on the logical vector to keep only desired columns
final <- final[logic_vector==TRUE];

# Merge the final data set with the acitivity_type table to include descriptive activity names
final <- merge(final,activity_type, by = "activityid",all.x=TRUE)

# Update the colnames vector to include the new column names after merge
col_names <- colnames(final)

#Delete abbreviations and clean names
col_names <- gsub("^f", "frequencyDomain", col_names)
col_names <- gsub("^t", "timeDomain", col_names)
col_names <- gsub("Acc", "Accelerometer", col_names)
col_names <- gsub("Gyro", "Gyroscope", col_names)
col_names <- gsub("Mag", "Magnitude", col_names)
col_names <- gsub("Freq", "Frequency", col_names)
col_names <- gsub("mean", "Mean", col_names)
col_names <- gsub("std", "StandardDeviation", col_names)
col_names <- gsub("JerkMag","JerkMagnitude",col_names)
col_names <- gsub("GyroMag","GyroMagnitude",col_names)

# Correct typo
col_names <- gsub("BodyBody", "Body", col_names)

# Remove special characters
col_names <- gsub("\\()","", col_names)


# Use new labels as column names
colnames(final) <- col_names

# Create a new table, final_noactivity without the activityType column
final_noactivity <- final[,names(final) != "activity_type"]

tidy_data <- final_noactivity %>% 
        group_by(subjectid, activityid) %>%
        summarise_each(funs(mean))

# Merging the tidy_data with activity_type to include descriptive acitvity names
tidy_data <- merge(tidy_data, activity_type,by = "activityid",all.x=TRUE)

# Export the tidy_data set 
write.table(tidy_data, "./tidy_data.txt",row.names = FALSE, quote = FALSE)


