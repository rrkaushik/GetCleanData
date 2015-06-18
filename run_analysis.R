rm(list=ls())
setwd("C:/Users/SESA207764/Google Drive/Coursera/03 - Getting and Cleaning Data/Assignment")

#function to read file and store in data frame
#pass in location - test, train or blank
#pass in filename - e.g. x_train
getData <- function(fileName, location="") {
    if(location=="") {
        f_fileName <- paste(getwd(), "/", fileName, ".txt", sep="")
    }
    else
    {
        f_fileName <- paste(getwd(), "/", location, "/", fileName, ".txt", sep="")
    }
    read.table(f_fileName)
}


# get activity labels
activity_labels <- getData("activity_labels", "")

# get x_test data
x_test <- getData("x_test","test")

# get  subject test data
subject_test <- getData("subject_test", "test")

# get  y test data
y_test <- getData("y_test", "test")

# convert to activity text
y_test2 <- lapply(y_test, function(x) activity_labels$V2[x])
test_data <- cbind(x_test, subject_test, y_test2)

# get x_train data
x_train <- getData("x_train", "train")

# get  subject train data
subject_train <- getData("subject_train", "train")

# get  y train data
y_train <- getData("y_train", "train")

# convert to activity text
y_train2 <- lapply(y_train, function(x) activity_labels$V2[x])
train_data <- cbind(x_train, subject_train, y_train2)

# join test and train data
m_data <- rbind(test_data, train_data)

# set column names
colnames(m_data)[562]="Subject"
colnames(m_data)[563]="Activity"

# get features
features <- getData("features", "")
colnames(m_data)[1:561] <- as.character(features$V2)
m_colnames <- as.character(features$V2)

# save indices of all columns with mean or std
ind <- grep("mean\\(\\)|std\\(\\)", m_colnames)

# extract the columns with mean and std
m_data <- m_data[, c(ind, 562, 563)]

# get the means
t_data <- aggregate(m_data, by=list(m_data$Subject, m_data$Activity), FUN=mean, na.rm=TRUE)
t_data <- t_data[, 1:68, drop=FALSE]
colnames(t_data)[1:2] = c("Subject", "Activity")

# output tidy data set to file
write.table(t_data, file="tidy_data.txt",row.names=FALSE)

