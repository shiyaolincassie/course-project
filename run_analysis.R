library(plyr)
x_test<-read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

x_train<-read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train<- read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
features <- read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[,mean_and_std]
names(x) <- features[mean_and_std, 2]

activities <- read.table("E:/US/STUDY/Coursera/R/cleaning data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

 y[, 1] <- activities[y[, 1], 2]
 names(y) <- "activity"

 names(subject) <- "subject"
 
 all <- cbind(x, y, subject)
 average <- ddply(all, .(subject, activity), function(x) colMeans(x[, 1:66]))
 View(average)
 write.table(averages_data, "averages_data.txt", row.name=FALSE)
 