#Modeling
#Linear Regression: Simple, Multiple
#SLR: y~x1; MLR: y~x1+x2....
#y- Dependent Variable, x-Independent Variable

head(women)
#y-wgt-dependent, x-hgt-independent
cor(women$height, women$weight)    #Strenght & Direction of Relationship
cov(women$height, women$weight)    #Cov-Direction of Relationship: + here, hgt inc-wgt inc
plot(women)

#lm command is used for linear modeling
fit1 =lm(weight ~ height, data=women)
summary(fit1)

#F Stats: pvalue << .05 : Linear Model exists
#Atleast 1 Independent Variable is significant in predicting Dependent Variable
#Multile Rsquare=.991 (Coefficient of Determination)|Taken when 1 Independent variable otherwise use Adjusted RSquared
#Multiple Rsquare: 99% of the variation in Y is explained by Xs
# y=mx+c : y= -87 + 3.45*height, No extrapolation(Prediction) & data that is collected can be used. Only interpolation.
range(women$height)
# Presence of Stars: Significant for the model

#Predictive weights for actual heights
women$weight
women$height
(y = -87 +3.45 * women$height)
fitted(fit1)                        #Fitted(fit1): Predicted wgt for actual height        
                                    #Line 27 must be equal to Line 28
                                    #Why has fited been used ?

#residual: Difference between predicted and actual weights
residuals(fit1)

summary(fit1)
summary(residuals(fit1)) 

summary(students$marks1)
summary(students [,5:6])            #For all Rows & Column 5 to 6 

(newdata1 = data.frame(height=c(60.4,55.9)))
(p1 =predict(fit1, newdata = newdata1, type='response'))  #type here is type of output
cbind(newdata1,p1)                                        #cbind: binds column| rbind: binds row

#Prediction here: For many different height, we will get weight
(newdata1 = data.frame(height=c(60.4,55.9, 77)))
(p1 =predict(fit1, newdata = newdata1, type='response'))
cbind(newdata1,p1)

#Check for Assumptions of Linear Regression: using plots
plot(fit1)

#### Linear Regression with two Independent Varisble
#Case Study
#Multiple Linear Regression : DV vs more than 1 IVs
#sales Qty vs price & promotion
#Predict Sales Qty from Price and Promotion of the Product

#Omni Store
#creating data using Vector
sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)

omni1 = data.frame(sales,price,promotion)
omni1
str(omni1)
nrow(omni1)
dim(omni1)

#lm for Multiple Regression
fit2 = lm(sales~ price+promotion, data=omni1)
summary(fit2)

# fitted(): Predicted values for input price and promotion
fitted(fit2)  

omni$sales
residuals(fit2)
summary(residuals(fit2))
summary(fit2)

range(omni$price) ; range(omni1$promotion)
(ndata2 = data.frame(price=c(60,70), promotion=c(300,400)))
(p2sales = predict(fit2, newdata=ndata2))
cbind(ndata2, p2sales)

#mfrow: multiple frame row 
par(mfrow=c(2,2))
plot(fit2)

par(mfrow=c(1,1))
plot(fit2)


#No pattern, Equal Variance
plot(fit2, which=1)

#Residuals are normally 
plot(fit2,2)

#No Hetero-scedascity
plot(fit2,3)

#Tells ouliers which affect model
plot(fit2,4)

omni1[c(11,14,15),]

fit3 = lm(sales ~ price+promotion, data=omni1[-c(11,14,15),])
plot(fit3,4)
summary(fit3)

#Divide Data into 2 parts | Divide date into 70% & 30%
#training set = 70%
#test set - 30%

head(women)
nrow(women)
library(dplyr)
women %>% sample_frac(.7) -> train1

