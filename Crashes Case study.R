install.packages("dplyr")
install.packages("ggplot2")
install.packages("corrplot")
library(dplyr)
library(ggplot2)
library(corrplot)
setwd("C:/Users/atoju/Toju personal case study")
traffic_data <- read.csv("Nigerian_Road_Traffic_data_cleaned.csv")
state_data <- read.csv("State_info.csv")
#correlation
cor_matrix <- cor(traffic_data[, c("Total_Crashes","Num_Injured", "Num_Killed")]) 
corrplot(cor_matrix, method = "circle")
#regression crashes vs year/quarter
model <- lm(Total_Crashes ~ Year + Quarter, data = traffic_data)
summary(model)
#trend summary
summary_data <- traffic_data %>%
  group_by(State) %>%
  summarise(Avg_Crashes = mean(Total_Crashes, na.rm = TRUE))
ggplot(summary_data, aes(x = reorder(State, -Avg_Crashes), y = Avg_Crashes)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Traffic Crashes by State (2020-2024)")
ggsave("Visualizations/output/state_crashes_bar.png")
install.packages("stringr")
library(stringr)
ggplot(summary_data, aes(x = reorder(State, -Avg_Crashes), y = Avg_Crashes)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  theme(axis.text = element_markdown(angle = 45, hjust= 0))
  labs(title = "Average Traffic Crashes by State (2020-2024)")
ggsave("Visualizations/output/state_crashes_bar.png")
install.packages("ggtext")
library(ggtext)
ggplot(summary_data, aes(x = reorder(State, -Avg_Crashes), y = Avg_Crashes)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  theme(axis.text = element_markdown(angle =90, hjust = 0))
labs(title = "Average Traffic Crashes by State (2020-2024)")
ggsave("Visualizations/output/state_crashes_bar.png")