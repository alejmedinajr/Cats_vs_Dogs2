# intall packages that will be used for this project
library(here)
library(maps)
library(ggplot2)
library(dplyr)

# world data will be of the world
pet_data = read.csv(here("Data", "pet-ownership-statistics-by-state_Group2.csv"))
head(pet_data)
str(pet_data)
colnames(pet_data) = c("region", "TotalHouseoldsPerc", "DogsPerc", "AvgNumDogs", "CatsPerc", "AvgNumCats", "DogDevotionScore", "StayedAtAJobTheyDislikedForDogPerc", "WhoWouldSpend4kToSaveDogPerc")
head(pet_data)


state_map = map_data("state")
head(state_map)

#colnames(pet_data)[1] = "region"
head(pet_data)

state_map_cats = left_join(state_map, pet_data, by="region")
head(state_map_cats)


basic_graph = ggplot(state_map_cats, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=TotalHouseoldsPerc))+
  scale_fill_viridis_c()
basic_graph