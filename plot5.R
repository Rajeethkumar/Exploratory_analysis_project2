
library("dplyr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle <- (subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD"))[c(4,6)]

png("plot5.png", width=800, height=700)

ggplot(vehicle, aes(factor(year), Emissions, fill=year)) + 
 geom_bar(stat="identity") +
 xlab("Year") +
 ylab("PM 2.5 emissions from vehicle") +
 ggtitle("PM 2.5 emissions from vehicle over the years at baltimore city")

dev.off()
