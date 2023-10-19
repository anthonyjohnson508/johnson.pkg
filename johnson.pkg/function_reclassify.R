# This function will clean the data by adding more detail to the class column. 
#In this function it changes the class from three categories (hatching, juvenile, and adult) to four categories (hatching, juvenile, subadult, and adult)


reclassify <- function(data, column_name, new_column) {
  data <- data %>%
    mutate({{new_column}} := case_when(
      .data[[column_name]] < 30 ~ "Hatchling",
      .data[[column_name]] >= 30 & .data[[column_name]] <= 119 ~ "Juvenile",
      .data[[column_name]] >= 120 & .data[[column_name]] <= 180 ~ "Subadult",
      .data[[column_name]] > 180 ~ "Adult",
      TRUE ~ "Unknown"
    ))
  return(data)
}



#test to see if it works
alligators_reclassify <- reclassify(alligators, column_name = "TL", new_column = "NewClass")

print(alligators_reclassify)
