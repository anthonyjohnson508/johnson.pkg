#function for final project
#This function transforms the data set by adding K-means cluster groups using just Lat and Long.
#K means cluster groups are useful as it allows to spatially test differences between groups.
#this function generates four new columns.
#four new columns = cluster which the animal belongs to, the number of animals in the group, the cluster groups latitude at the center, and the cluster groups longitude at the center.

cluster_data <- function(data, lat_column, long_column, k) {
  coordinates <- data[c(lat_column, long_column)]
  kmeans_result <- kmeans(coordinates, centers = k)
  data$cluster <- kmeans_result$cluster
  cluster_counts <- data %>%
    group_by(cluster) %>%
    summarise(Gators_Per_Group = n_distinct(Unique_ID))
  cluster_centers <- data %>%
    group_by(cluster) %>%
    summarise(center_lat = mean(.data[[lat_column]]),
              center_long = mean(.data[[long_column]]), .groups = 'drop')
  result <- left_join(data, cluster_counts, by = "cluster") %>%
    left_join(., cluster_centers, by = "cluster")
  
  return(result)
}

#test to see if it works

alligators_clustered <- cluster_data(alligators, lat_column = "Lat", long_column = "Long", k = 10)
print(alligators_clustered)
