#Hierarchical clustering 

#importing the mall dataset
dataset = read.csv('Mall_Customers.csv')

x = dataset[4:5]

#using the dendrogram to find the optimal number of clusters
dendrogram = hclust(dist(x,method="euclidean"),method="ward.D")
#Ward.D is used to minimize variance within the clusters

plot(
  dendrogram,
     main=paste('Dendrogram'),
     xlab='Customers',
     ylab = 'Eculidean Distances'
  )


#Fitting hierarchical clustering to the mall dataset
hc = hclust(dist(x,method="euclidean"),method="ward.D")

y_hc = cutree(hc,5)

#Visualizing the clusters
library(cluster)
clusplot(x,
         y_hc,
         lines=0,
         shade=TRUE,
         color=TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste('Clusters of customers'),
         xlab="Annual Income",
         ylab="Spending Score"
         )