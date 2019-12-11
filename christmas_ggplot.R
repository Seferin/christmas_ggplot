# R script for Christmas Plot
library(ggplot2)
library(png)

#Create greeting
  greeting <- "HAPPY CHRISTMAS"
  greeting_list <- NA
  for(i in 1:nchar(greeting)){
    greeting_list[i] <- substr(greeting, i, i) # Split to list of characters
  }

# Create tree data
  series <- c(1, 1, seq(5, 0, by=-0.5), 0, 0)
  
  data <- data.frame(
    name=c(letters[1:15]),  #Use alphabet to prevent ggplot from re-ordering the greeting alphabetically
    value1=series,
    value2=series * -1
  )

  
# Chart
card <- ggplot(data, aes(x=name) ) +
  geom_bar(aes(x=name, y=value1), stat="identity", width = 1, fill="black") +
  geom_bar(aes(x=name, y=value2), stat="identity", width = 1, fill="black") +
  geom_text(aes(x="n", y=0), label="★", size=25) + # Add star to christmas tree
  geom_point(aes(x="a", y=3), pch="\uD83C\uDF81", size=25) + # Add present under tree
  scale_x_discrete(name="", labels=rev(greeting_list)) + # Add greeting to labels
  scale_y_continuous(name="knows when you've been", breaks = c(-3, 3), labels=c("Bad", "Good")) +
  coord_flip() +
  theme_classic() +
  theme(axis.text=element_text(size=14), 
        axis.title=element_text(size=14,face="bold"))

  
jpeg("tree.jpg", width = 500, height = 800, quality = 100)
card
dev.off()
