#Graphs

mtcars
names(mtcars)
table(mtcars$cyl)             #cyl wise how many cars
table(mtcars$cyl, mtcars$am)  #cross table with cyl & am

#Continuous Data - Histogram, Boxplot 
mtcars$mpg
hist(mtcars$mpg)
boxplot(mtcars$mpg)
?boxplot
boxplot(mtcars$mpg, horizontal = T)
boxplot(mpg~gear, data=mtcars, col=1:3)

#Milege v/s Gear
t1 = table(mtcars$gear)
t1

#
barplot(t1, col=1:3)
barplot(c(10,3,5))
pie(c(10,3,5))

#Students
t2 = table(students$college)
barplot(t2)

#Gender
t3 = table(students$gender)
barplot(t3)
title('This is bar plot', sub = 'Subtitle') #To 
pie(t3)


