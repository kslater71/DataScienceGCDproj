# DataScienceGCDproj
Course project for Coursera's "Data Science: Getting and Cleaning Data" class

# This repo contains the following:
* run_analysis.R : The R file created for the course project.
* tidyData.txt : The output file submitted for the course project. This file was generated via the R command: write.table(tidyData, file="tidyData.txt", row.names=FALSE)
* CodeBook.md : Details of the data set produced by run_analysis.R and the source data
* 

# Summary of run_analysis.R
The script assumes that the source file "getdata-projectfiles-UCI HAR Dataset.zip" has been uncompressed into the folder "UCI HAR Dataset" that resides in the same directory as run_analysis.R. The expected files and structure are as follows:
> run_analysis.R
> UCI HAR Dataset
>> test
>> train
