library("dplyr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreVehicle <-  (subset(NEI,fips == "24510" & type == 'ON-ROAD'))[c(4,6)]
baltimoreVehicle$County <- "Baltimore City, MD"
losangelsVehicle <-  (subset(NEI,fips == "06037" & type == 'ON-ROAD'))[c(4,6)]
losangelsVehicle$County <- "Los Angeles County, CA"


compare.la.bm <- rbind(baltimoreVehicle,losangelsVehicle)

png("plot6.png", width=800, height=700)

ggplot(compare.la.bm, aes(factor(year), Emissions, fill=year)) + 
 geom_bar(stat="identity") +
 facet_grid(County ~., scales="free") + 
 xlab("Year") +
 ylab("PM 2.5 emissions from vehicles ") +
 ggtitle("PM 2.5 emissions from vehicle over the years")

dev.off()