library(tidyverse)
library(cluster)
library(dplyr)

## Convert day to number
forestfires$day <- recode(forestfires$day, "sun"="7", "mon"="1", "tue"="2", "wed"="3", "thu"="4", "fri"="5", "sat"="6")

## Convert month to number
forestfires$month <- recode(forestfires$month, "jan"="1", "feb"="2", "mar"="3", "apr"="4", "may"="5", "jun"="6", "jul"="7",
                            "aug"="8","sep"="9","oct"="10","nov"="11", "dec"="12")

head(forestfires)
ggplot(forestfires,aes(wind, temp)) +
  geom_point() +
  geom_smooth(method='lm')

temp.lm <- lm(temp ~ wind, data=forestfires)
summary(temp.lm)



cormat <- forestfires%>%select_if(is.numeric)%>%na.omit %>% cor(use="pair")
cormat

#cormat_1 <-cormat %>% as.data.frame %>% rownames_to_column("var1")

tidycor <- cormat %>%
  as.data.frame %>%
  rownames_to_column("var1") %>%
  pivot_longer(-1, names_to = "var2", values_to = "correlation")

tidycor

tidycor %>% ggplot(aes(var1, var2, fill=correlation)) + 
  geom_tile() + 
  scale_fill_gradient2(low="red", mid="white", high = "blue") +
  geom_text(aes(label=round(correlation,2)),color = "black", size = 2)+ #overlays correlation values
  theme(axis.text.x = element_text(angle = 90)) + #flips the x-axis labels
  coord_fixed()
