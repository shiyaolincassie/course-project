# course-project


The script run_analysis performs the 5 steps:

First, I use rbind() to merge data.Then I extract columns with the mean and standard deviation measures from dataset. After getting columns, I correct the columns names.
Then, I matched the activity name with numbers 1:6 and replace them in Y dataset.

Finally, I generate a new dataset computing average measures for each subject and activity type. I store the result into the file called average.txt.
Variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data.
x, y and subject merge the previous datasets to further analysis.
features contains the correct names for the x dataset.
all merges x, y and subject in a big dataset.
averages contains the averages which will be later stored in a .txt file. 
