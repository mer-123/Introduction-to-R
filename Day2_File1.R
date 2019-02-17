# Read Data into R Environment

#CSV Files----
#Read from CSV file in PC
head(iris)
write.csv(iris, "./data/iris.csv", row.names=F)
read1 = read.csv(file="./data/iris.csv", header = TRUE,sep = ",")
read1 = read.csv(file="./data/dhiraj.csv", header = TRUE,sep = ",")

#How to create Excel from CSV
write.csv(iris, "./data/iris.csv", row.names=F)
read1 = read.csv(file="./data/iris.csv", header = TRUE,sep = ",")


#How to create CSV from Excel: Go to the excel sheet & save it as CSV
read1 = read.csv(file="./data/merian.csv", header = TRUE,sep = ",")
str(read1)
class(read1)
head(read1)

#How to import data from Google Sheets: From URL: Read CSV from Web

#data.table will Help in loading Data
library(data.table)

#Google sheet
read_txt = read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header = FALSE)
head(read_txt)
library(gsheet) #install it
install.packages('gsheet')
library(gsheet)
url_gsheet = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"
df_gsheet = as.data.frame(gsheet2tbl(url_gsheet))
head(df_gsheet)

#Import  from google sheet : REal time changes here
url_gsheet2 = "https://docs.google.com/spreadsheets/d/1ssp_V0ksmDQCEbxPjxjYJoxwb7cTM22gQtSnX5rqqlY/edit?usp=sharing"
newdata = as.data.frame(gsheet2tbl(url_gsheet2))
head(newdata)
tail(newdata)






