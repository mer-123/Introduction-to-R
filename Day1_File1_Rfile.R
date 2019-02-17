women
git config --global user.email "mereco1517@gmail.com"
git config --global user.name "Your Name"

mtcars
?mtcars
mean(mtcars$mpg)
mean(mtcars$hp)
colMeans(mtcars)
rowMeans(mtcars)

?head(mtcars)

#First row
head(mtcars,1)

#Last row
tail(mtcars)

#histogram
hist(mtcars$mpg)

hist(mtcars$mpg, breaks=3)

#vectors
x =c(1,2,5,7)
x
class(x)

x1 =c(2L,8L)
x1
class(x1)
x1 <- c(2L,8L) #Working
x1

x3 <- c('a','B','Mer')
x3
class(x3)

x4 = c(TRUE,FALSE,T,F)
x4

x5=1:10000
x5

x6 <- 2 #Another way of Assignment; other is = 
x6

#Normal distri
(x7 = rnorm(100))
mean(x7)
sd(x7)
length(x7) #No of elements 
plot(density(x7))
hist(x7)

#overlay graphs
hist(x7, freq = F)
points (density(x7))

#Graphs for different mean/std deviation
(x8 = rnorm(100, mean = 60, sd=10))
mean(x8)
sd(x8)
plot(density(x8))
hist(x8)
hist(x8, freq = F) #Overlay
points (density(x8))

#Install library for Skewnwness & Kurtosis
library(e1071)
kurtosis(x8)
skewness(x8)

#Filtering using Uniform Distribution
x9 = runif(100, 30, 90) #uniform distributuion
?runif
x9
trunc(x9) #Remove decimal places
round(x9) #Rounding off
floor(x9)  # Takes Lower Value
ceiling(x9) #Raising to higher level/ Takes higher value

x10 = ceiling (x9)
x10

#Sorting, Filter Data
mean(x10)
median(x10)
sort(x10) #Increasing
sort(x10, decreasing=T) #Decreasing order

x10[x10 > 60] #Number greater than 60
x10
x10[1:10] #first 10
x10[20:30]
x10[ -c(1:20)] #Excluding 1-20 numbers
x10[c(1,5,7)]  #Numbers according to position

# Matrices
m1 =matrix(1:24, nrow=6)
m1
dim(m1)

m2 =matrix(1:56, ncol=8)
m2

m3 =matrix(1:24, ncol=6, byrow = T) #Data will be filled Row- wise
m3

#give names to column & row
colnames(m3)=month.abb[1:6] #Column Names
m3
rownames(m3)=paste('Product', 1:4, sep='_') #Row Names
m3

rowMeans(m3)
colMeans(m3)
rowSums(m3)
colSum(m3) #Wrong. Why?
colSums(m3)

#Print only first two columns
m1[ ,1:2]
m3[ ,1:2]

m3[c(1,3), ]
colMeans((m3[c(1,3),]))
m3[ , c('Apr', 'Jun')]

#Min, Max, Range
min(m3)
max(m3)
range(m3)

#Data Frame (no of col=no of row)
n=30
(rollno= paste('F',1:30,sep='_')) #Roll No
(sname = paste('Student', 1:30,sep='&'))

gender = sample(c('M','F'), size=n, replace=T) #50-50% Chance
table(gender) #Count Male & Female

gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3))    #Different Chance/Probability
table(gender)

#Set Seed Commant : To get the same sampling pattern everytime
set.seed(1234)
gender = sample(c('M','F'), size=n, replace=T, prob=c(.7,.3)) 
table(gender) #Table has calculated the frequency of male & female
?set.seed

#Proportion- Table
(t1=table(gender))
prop.table(t1)

college = sample (c('SRCC', 'FMS', 'IIM'), size=n, replace= T, prob=c(.4,.3,.3))
table(college)

(t2=table(college))
prop.table(t2) #Percentage

#When size increases
college = sample (c('SRCC', 'FMS', 'IIM'), size=1000, replace= T, prob=c(.4,.3,.3))
table(college)

(t2=table(college))
prop.table(t2)  #Percentage

#Using set seed
set.seed(12)
college = sample (c('SRCC', 'FMS', 'IIM'), size=n, replace= T, prob=c(.4,.3,.3))
table(college)

(t2=table(college))
prop.table(t2)

#Adding marks and other things and making a table 
(marks1 = round(rnorm(n=n, mean=60,sd=10),0)) #Round off zero decimal value 
(marks2 = round(rnorm(n=n, mean=55, sd=15),0))
rollno; sname; gender; college; marks1; marks2
length(gender)

students = data.frame(rollno, sname, gender, college, marks1, marks2)
students
head(students)

students$rollno
students[,c(2, 5:6)]
students[,c('sname', 'marks1', 'marks2')]
str(students)
summary(students)  #Structure command: structure of data behind it
quantile(students$marks1, probs=c(0,.25,.5,.75,1))
quantile(students$marks1, probs=seq(0,1,.25))
quantile(students$marks1, probs=seq(0,1,.1))  #Decile 
seq(0,1,.1)
seq(1,100,3)

#Convert from factor to Character 
students$rollno =as.character(students$rollno) #changed as character
students$sname =as.character(students$sname)
str(students)
summary(students)
head(students)

#Export file to Excel as csv 
write.csv(students, 'fms.csv', row.names = F)

#Import file from Excel to R
students2 = read.csv('fms.csv')
head(students2)

#If we don't remeber the file name or the name is 
students3 = read.csv(file.choose( ))
head(students3)

quantile(students$marks1, probs=seq(0,1,.01))  #Percentile

#Students


students[students$marks1 > 60 ,]
students[students$gender =='F',]  #Female
students[students$gender == 'F' & students&colleges =='SRCC',] #Female, SRCC

#highest from all college
students %>% filter (gender == 'M')

#Genderwise summary
students %>% group_by(gender) %>% summarise (mean(marks1), mean(marks2))
students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% filter(college == 'FMS') %>% select(marks1,marks2)

######