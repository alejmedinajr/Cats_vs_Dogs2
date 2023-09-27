library(here)
library(maps)
library(ggplot2)
library(dplyr)

pet_data <- read.csv(here("DATA","pet-ownership-statistics-by-state_Group2.csv"))

head(pet_data)
str(pet_data)
colnames(pet_data) <- c("region","TotalHouseoldsPerc",	"DogsPerc",	"AvgNumDogs",	"CatsPerc",	"AvgNumCats",	"DogDevotionScore",	"StayedAtAJobTheyDislikedForDogPerc",	"WhoWouldSpend4kToSaveDogPerc")
state_map <- map_data("state")
pet_data$region <- tolower(pet_data$region)

state_map_pets <- left_join(state_map,pet_data, by = "region")
head(state_map_pets)

basic_graph <- ggplot(state_map_pets, aes(x= long, y = lat, group = group)) +
  geom_polygon(aes(fill = AvgNumDogs)) +
  scale_fill_viridis_c(option = "turbo")
basic_graph
