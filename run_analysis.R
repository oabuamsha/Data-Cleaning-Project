xtest=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/XS_test.txt", colClasses="numeric")
ytest=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/YS_test.txt", colClasses="numeric")
subjecttest=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subjectS_test.txt", colClasses="numeric")
pw
ctest=cbind(subjecttest,ytest,xtest)
class(ctest)
xtrain=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/XS_train.txt", colClasses="numeric")
ytrain=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfes_UCI HAR Dataset/UCI HAR Dataset/train/yS_train.txt", colClasses="numeric")
subjecttrain=read.table("C:/Oula/R/Data Cleaning Mooc/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subjectS_train.txt", colClasses="numeric")
ctrain=cbind(subjecttrain,ytrain,xtrain)

all=rbind(ctrain,ctest)
names(all)=c("a","b","c","d","e","f")
all
all$a=as.factor(all$a)
all$b=as.factor(all$b)
