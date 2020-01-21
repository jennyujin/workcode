##### Querying SQL Server Data from R

## INSTALL PACKAGE - RODBC
## download the package from internet to local direction (if your DB is on the internal network)
## then, install package from appointed local direction
install.packages("D:\\Rpackages\\RODBC_1.3-16.zip", repos = NULL, type="source")
library(RODBC)

## myconn - hold a reference to a connection 
myconn <- odbcDriverConnect("DRIVER={NetezzaSQL};SERVER=00.00.00.000;PORT=0000;DATABASE=DBNAME;UID=MYID;PWD=MYPWD")

## import data by 
data <- sqlQuery(myconn, "select * from TABLENAME") #believeNRows=TRUE
head(data) #print out 5 lines

data <- sqlQuery(myconn, "select * from TABLENAME", max=5) #print out 5 lines
data

data<-sqlGetResults(myconn, max=10) #print out 10 lines
data #sqlGetResults: print basic results without sql query

write.csv(data, "D:\\Rdata\\20200121_practive.csv")
close(myconn)






