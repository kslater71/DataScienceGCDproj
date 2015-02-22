# Source Data
The source data is available from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

<p>
The original data source is from the UCI Center for Machine Learning and Intelligent Systems, and the 
Human Activity Recognition Using Smartphones Data Set. Full details of the project and the data set are available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
<p>
The source data consists of various smartphone accelerometer and gyroscope measurements taken from a group of 30 volunteers, which performing a range of tasks. The data is provided as 2 distinct sets of test and training data.

# Resulting Tidy Data set
The run_analysis.R script generates a the data frame "tidyData" in the following form:

<pre>
Source: local data frame [11,880 x 4]
Groups: SubjectID, ActivityName

   SubjectID ActivityName           Variable    AvgValue
1          1       LAYING    tBodyAcc.mean.X  0.22159824
2          1       LAYING    tBodyAcc.mean.Y -0.04051395
3          1       LAYING    tBodyAcc.mean.Z -0.11320355
4          1       LAYING     tBodyAcc.std.X -0.92805647
5          1       LAYING     tBodyAcc.std.Y -0.83682741
6          1       LAYING     tBodyAcc.std.Z -0.82606140
7          1       LAYING tGravityAcc.mean.X -0.24888180
8          1       LAYING tGravityAcc.mean.Y  0.70554977
9          1       LAYING tGravityAcc.mean.Z  0.44581772
10         1       LAYING  tGravityAcc.std.X -0.89683002
..       ...          ...                ...         ...
</pre>


