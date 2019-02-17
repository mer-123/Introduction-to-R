#Logistic Regression (Yes/No, This/That, Binary ouput, Win/loose)

# Copy code from 2e3-LOGR-gre.R

inputData <- read.csv("htpp://stats.idre.ucla.edu/stat/data/binary.csv")
head(inputData)
dim(inputData)
inputData
summary(inputData)

#sd of all columns
sd(inputData$admit)
sd(inputData[,1])
sd(inputData[,2])
sd(inputData[,3])
sd(inputData[,4])
lapply(inputData, quantile) #Instead of using line13 to 16, this can be used
sapply(inputData, quantile) #Instead of using line13 to 16, this can be used

data$rank = factor(data$rank)
data$admit = factor(data$admit)
str(inputData)


#To make sure there are not 0 cells
table(data$rank, data$admit)

#Which rank of ins
(t1= xtabs(~admit + rank, data =data))

#addmargin: Row wise & Column wise Sum 
addmargins(t1)
prop.table(t1,2)

#xtabs(~gear + cyl +am , data=mtcars)

#Create Logistic Model
head(data)
mylogit = glm(admit ~ gre + gpa + rank, data = data, family = 'binomial')

summary(mylogit)


#Odd Ratios
#Confusion Matrix/Game Theory Table

#Install Caret package

#Autocorrelation

