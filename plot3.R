NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

typeData <- (subset(NEI, Emissions > 0))[c(4,5,6)]
typeYearSum <- typeData %>% group_by(type,year) %>% summarise_at(vars(Emissions) , sum)

png("plot3.png", width=800, height=700)

ggplot(typeYearSum, aes(x=factor(year),y=Emissions/1000,fill=type)) +
 geom_bar(stat="identity") +
 facet_grid(. ~ type) +
 xlab("years") +
 ylab("PM 2.5 emissions in kilo tons")+
 ggtitle("Total PM 2.5 emissions comparison by year and type")
 
 dev.off()