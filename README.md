# getdataProject

##Cleaning the Data:

* Took only the columns ending with -mean() or -std().
* Removed the characters -,( and ).
* Used gsub() on the vector of names to replace t and f at the start with time or frequency.
* Fixed the names, replaced Acc with Accelerometer, BodyBody with Body and Mag with Magnitude, for example.
* Used camelCase to improve readability of long variables names.
* Changed activities numerical values to factors with corresponding names.

##Merging and Writing the Tidy Data Set:

* Bound the training and test data for subjects (S), cleaned activities (newY) and clean feature vectors (newX).
* Bound the subjects, cleaned activities and clean feature vectors into a data set (Data).
* Took the average of each variable for each activity and each subject with: tidy<-aggregate(Data[,3:ncol(Data)],by=list(Data[,1],Data[,2]),FUN=mean)
* Wrote the data to a file with: write.table(tidy,'./tidyDataSet.txt',row.names=F)
