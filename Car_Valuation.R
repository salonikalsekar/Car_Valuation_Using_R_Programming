### First import all the necessary libraries
##The party and rattle libraries are used for pretty plotting of the decision tree
library(rpart)
library(rattle)
library(party)
##Importing data set cars.csv
cars <- read.csv("cars.csv", header = F)

##Check missing values by displaying the summary
summary(cars)
## Training set and testing set
set.seed(1)
training <- sample(nrow(cars), ceiling(nrow(cars) * 0.8))
train.data <- cars[training, ]
test.data <- cars[-training, ]


## Decision tree 

install.packages('RColorBrewer')
install.packages("rpart.plot")
library(RColorBrewer)

decisionT <- rpart(car_distribution ~ ., data = train.data , control = rpart.control(minsplit = 100, cp= 0.02))
plot(decisionT)
text(decisionT, cex=0.3)

fancyRpartPlot(decisionT, main = "Model", cex= 0.5)


##Prediction
test <- predict(decisionT, newdata = test.data, type = "class")


## checking accuracy
accinfo <- table(Predicted_values = test, Values = test.data$car_distribution)
accinfo

