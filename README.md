# DataScienceGCDproj
Course project for Coursera's "Data Science: Getting and Cleaning Data" class

# This repo contains the following:
* run_analysis.R : The R file created for the course project.
* tidyData.txt : The output file submitted for the course project. This file was generated via the R command: write.table(tidyData, file="tidyData.txt", row.names=FALSE)
* CodeBook.md : Details of the data set produced by run_analysis.R and the source data
* 

# Summary of run_analysis.R
The script assumes that the source file "getdata-projectfiles-UCI HAR Dataset.zip" has been uncompressed into the folder "UCI HAR Dataset" that resides in the same directory as run_analysis.R. 

<p> The script consists of 3 functions that read the source files (getFeatures, getActivities, and getData) and the main code block.
<p>
The main code block consists of the following steps:<p>

1. Data frames are created from the source files for the features (i.e. measure names) and activities. 
2. Data frames are created from the source data for the test and train data sets. Column names are assigned based on the features data frame.
3. The test and train data frames are combined into a new data frame named "allData".
4. The dimension ActivityName is added to allData, with the values defined based on the existing ActivityID and the activities data frame.
5. The width of allData is reduced to the desired columns; specifically the SubjectID, ActivityName and any measurement that is of the type .std() or .mean() from the source data. Not that measurements such as  "fBodyBodyGyroJerkMag-meanFreq()" and "angle(Y,gravityMean)" are not included as these are not true standard deviation and mean measurements. 
6. Column names are cleaned up so they align with R standards. Specifically any "()" in the source data is replaced with ".".  For example, the source measurement "tBodyAcc-mean()-X" becomes "tBodyAcc-mean.-X".
7. The resulting data frame "newData" is a complete data set as required for steps 1-4 of the project.
8. A new data frame "tidyData" is created to satisfy the tidy data requirement for step 5. This consists of a) reducing the columns to 4 (SubjectID, ActivityName, Variable, AvgValue) b) grouping by SubjectID, ActivityName and Variable, and c) calculating the mean value of each group.
9. The resulting tidyData is in the following form..

<pre>
   SubjectID ActivityName           Variable    AvgValue
1          1       LAYING    tBodyAcc.mean.X  0.22159824
2          1       LAYING    tBodyAcc.mean.Y -0.04051395
3          1       LAYING    tBodyAcc.mean.Z -0.11320355
4          1       LAYING     tBodyAcc.std.X -0.92805647
5          1       LAYING     tBodyAcc.std.Y -0.83682741
...
</pre>

