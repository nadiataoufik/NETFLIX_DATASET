# loading the movie metadata and transformation 
movie_metadata=read.csv("C:/Users/nadiataoufik/Documents/RPROGRAM/movie_metadata.csv")
View(movie_metadata)
dim(movie_metadata)
class(movie_metadata)
data.matrix(movie_metadata)->movie
class(movie)
#removing all the null values 
na.omit(movie)->movie
# selecting sample 5000 values 
movie[sample(nrow(movie),500),]->smple
view(smple)
View(smple)
#selecting the facebook likes c(9,23)
smple[,c(9,23)]->short_smple
view(short_smple)
View(short_smple)
class(short_smple)
data.matrix(short_smple)->smple_matrix
class(smple_matrix)
#elbow curve 
(nrow(smple_matrix)-1)*sum(apply(smple_matrix, 2, var))->wss
wss
for(i in 2:15)sum(kmeans(smple_matrix,centers = i)$withinss)->wss[i]
plot(1:15,wss,type="b",xlab = "number of k",ylab = "within sum square ")
#k mean clusring from the elbow curve the k=2 is the best choice 
kmeans(smple_matrix,3,nstart = 25)->cl
cl
plot(smple_matrix,col=(cl$cluster+1),main = "kmeans result with 2 clusters",pch=1,cex=1 ,las=1)
points(cl$clusters,col=12,pch=8,cex=2)
