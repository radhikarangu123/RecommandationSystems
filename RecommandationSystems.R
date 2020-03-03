#################Recommandation system Assignment############################
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
library("recommenderlab")
library(caTools)
books<-read.csv(file.choose())
View(books)
class(books)
str(books)
table(books$Book.Title)
table(books$ratings...3.)
hist(books$ratings...3.)
#the datatype should be realRatingMatrix inorder to build recommendation engine
books_rating_matrix<-as(books,'realRatingMatrix')

#Popularity based 
books_recomm_model1<-Recommender(books_rating_matrix,method="POPULAR")

#prediction for two users
recommanded_items1<-predict(books_recomm_model1,books_rating_matrix[423:424],n=5)
as(recommanded_items1,"list")
## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

books_recomm_model2 <- Recommender(books_rating_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(books_recomm_model2, books_rating_matrix[413:414], n=5)
as(recommended_items2, "list")

#

