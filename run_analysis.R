##reading the files
testSubj<-read.table('./UCI HAR Dataset/test/subject_test.txt')
trainSubj<-read.table('./UCI HAR Dataset/train/subject_train.txt')
testY<-read.table('./UCI HAR Dataset/test/y_test.txt')
trainY<-read.table('./UCI HAR Dataset/train/y_train.txt')
testX<-read.table('./UCI HAR Dataset/test/X_test.txt')
trainX<-read.table('./UCI HAR Dataset/train/X_train.txt')
features<-read.table('./UCI HAR Dataset/features.txt')[,2]
a<-strsplit(tolower("WALKING,WALKINGUP,WALKINGDOWN,SITTING,STANDING,LAYING"),',')[[1]]
acts<-factor(a,levels=a)

##merging test and training data
activities<-rbind(trainY,testY)[,1]
Y<-acts[activities]
X<-rbind(trainX,testX)
S<-rbind(trainSubj,testSubj)

##taking the variables of mean and std
requiredColumns<-grep("(std|mean)\\(",features)
rc<-features[requiredColumns]
rc<-as.character(rc)

##renaming the variables
rc<-gsub('\\(\\)','',rc)
rc<-gsub('-','',rc)
rc<-gsub('^t','time',rc)
rc<-gsub('^f','frequency',rc)
rc<-gsub('Acc','Accelerometer',rc)
rc<-gsub('Gyro','Gyroscope',rc)
rc<-gsub('Mag','Magnitude',rc)
rc<-gsub('mean','Mean',rc)
rc<-gsub('std','Std',rc)

##merging subject, activity and measurements data
colnames(S)<-c('subjectID')
newY<-data.frame(Y)
colnames(newY)<-c('activity')
newX<-X[requiredColumns]
colnames(newX)<-rc
Data<-cbind(S,newY,newX)

##making a tidy dataset and writing it
tidy<-aggregate(Data[,3:ncol(Data)],by=list(Data[,1],Data[,2]),FUN=mean)
colnames(tidy)<-colnames(Data)
write.table(tidy,'./tidyDataSet.txt',row.names=F)
