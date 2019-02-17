#Data Set

#partition the data into train and test set
mtcars
nrow(mtcars)
#train-70%, test-30%
sample(x=1:32, size=.7 * 32)

#When dataset is huge.Below can be used
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars), replace=F)
index

#Choosing paricular Row
mtcars[1,]      #First Row,All columns
mtcars[-1,]     #Leaving First Row, All columns

train= mtcars[index,]
test= mtcars[-index,]

nrow(train)
nrow(test)
nrow(train) + nrow(test)


women
nrow(women)
sample(1:10, size=.7 * 10)
sam = sample(1:nrow(women), size=.7 * nrow(women))
sam

women[]
women[1,]
women[1:5,]
women[sam,]
train = women[sam,]
test = women[-sam,]

fit1 = lm(weight ~ height, data=train)
summary(fit1)
predict(fit1, newdata=test, test='response')
cbind(predicted=p4, actual=test$weight, height=test$height)
