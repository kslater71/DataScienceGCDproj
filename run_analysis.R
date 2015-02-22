library(dplyr)
library(tidyr)

getFeatures <- function(){
     ## reads features.txt and returns data frame
     df<-read.table("UCI HAR Dataset/features.txt", 
                    col.names=c("FeatureID","FeatureName"), 
                    colClasses=c("integer","character")
     )
     return(df)
}

getActivities <- function(){
     ## reads activity_lables.txt and returns data frame
     df<-read.table("UCI HAR Dataset/activity_labels.txt", 
                    col.names=c("ActivityID","ActivityName"), 
                    colClasses=c("integer","character")
     )
     return(df)
}

getData <- function(setName,colNames){
     # reads subject, x and y files
     file1=paste("UCI HAR Dataset/",setName,"/subject_",setName,".txt",sep="")
     file2=paste("UCI HAR Dataset/",setName,"/y_",setName,".txt",sep="")
     file3=paste("UCI HAR Dataset/",setName,"/X_",setName,".txt",sep="")
     #print(file1)
     #print(file2)
     #print(file3)
     
     df1<-read.table(file1, 
          col.names=c("SubjectID"), 
          colClasses=c("integer")
     )
     df2<-read.table(file2, 
          col.names=c("ActivityID"), 
          colClasses=c("integer")
     )
     df3<-read.table(file3)
     names(df3)<-make.names(colNames,unique=TRUE)
     
     #str(df1)
     #str(df2)
     #str(df3)
     
     df<-cbind(df1,df2,Group=setName)
     df<-cbind(df,df3)
     return(df)
     
}


## start
features<-getFeatures();
activities<-getActivities();
testData<-getData('test',features$FeatureName)
trainData<-getData('train',features$FeatureName)

# combine test and train data into a single dataset
allData<-rbind(testData,trainData)
rm(testData)
rm(trainData)

# add activity names
allData$ActivityName<-NA
allData$ActivityName[allData$ActivityID==1]<-"WALKING"
allData$ActivityName[allData$ActivityID==2]<-"WALKING_UPSTAIRS"
allData$ActivityName[allData$ActivityID==3]<-"WALKING_DOWNSTAIRS"
allData$ActivityName[allData$ActivityID==4]<-"SITTING"
allData$ActivityName[allData$ActivityID==5]<-"STANDING"
allData$ActivityName[allData$ActivityID==6]<-"LAYING"

# reduce to the desired columns
dfCols<-grep("mean\\(\\)|std\\(\\)",features$FeatureName,value=TRUE)
dfCols<-make.names(dfCols, unique=TRUE)
dfCols<-c("SubjectID","ActivityName",dfCols)
newData=select(allData,one_of(dfCols))
# cleanup column names that result from std() and mean()
newNames=gsub("\\.\\.","",names(newData))
names(newData)<-newNames
# newData now contains the limited set of columns and good column names

# create tidy data set
tidyData <- newData %>% 
     gather(Variable,Value,-SubjectID,-ActivityName) %>%
     group_by(SubjectID, ActivityName, Variable)%>%
     summarize(AvgValue=mean(Value))  

print(tidyData)




