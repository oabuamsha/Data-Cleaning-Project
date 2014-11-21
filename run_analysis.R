#Reading and Decoding the activities according to the given codes 
Activities=read.table("activity_labels.txt")
#a function that is used when creating both parts of the  data below to add the activity description
Decode<-function(x){return(Activities[x,2])} 

#Reading the test data
xtest=read.table("./test/X_test.txt", colClasses="numeric")
ytest=read.table("./test/Y_test.txt", colClasses="factor")
subjecttest=read.table("./test/subject_test.txt", colClasses="factor")
#Creation of the tidy test data with subject numbers and activity codes and explicit nature
ctest=cbind(subjecttest,ytest,sapply(ytest,Decode),xtest)

#Reading the train data
xtrain=read.table("./train/X_train.txt", colClasses="numeric")
ytrain=read.table("./train/y_train.txt", colClasses="factor") #Il faut changer le code en nom d'activite
subjecttrain=read.table("./train/subject_train.txt", colClasses="factor")
#Creation of the tidy train data with subject numbers and activity codes and explicit nature
ctrain=cbind(subjecttrain,ytrain,sapply(ytrain,Decode),xtrain)

#Merging The  complete data
all=rbind(ctrain,ctest)

#reading and selecting the needed subset of features
Features=read.table("features.txt",colClasses=c("numeric","character"))
NeededFeatures=vector() 

for (row in 1:(dim(Features)[1])){
  if (grepl("mean",Features[row,2]) || grepl("std",Features[row,2] )) NeededFeatures<<-c(NeededFeatures,row)
}
#Selecting the subdata of interest
SubDataset=all[,c(1,2,3,(NeededFeatures+3))] 
#naming the variables
names(SubDataset)=c("subject", "activity-code","activity-name",gsub("\\(\\)","",Features[NeededFeatures,2]))
#Creation of the code book
write.table(names(SubDataset),"CodeBook.txt",col.names="The features in the tidy dataset:")

#Splitting the data according to subjects and activities
SSD=split(SubDataset,list(SubDataset[,1],SubDataset[,2]),drop=TRUE)
#computing the Averages:
#We have to transpose the matrix so that the ligns are the (subject X activity) couples, and columns are the averages
AverageTable=t(sapply(SSD,function(x) colMeans(x[,4:82])))  
AverageData=write.table(AverageTable,"AverageData.txt", row.names=F) 
print(AverageTable)
