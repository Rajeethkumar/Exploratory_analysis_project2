library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- merge(NEI, SCC, )
comb.coal <- grepl("Fuel Comb.*Coal", total$EI.Sector)
coal <- total[comb.coal,]
coalEmissions <- (subset(coal, Emissions > 0))[c(4,6)]
coalEMISum <- aggregate(Emissions ~ year, coalEmissions,FUN= "sum")

png("plot4.png", width=800, height=700)

ggplot(coalEMISum, aes(factor(year) , Emissions/1000, fill=year)) +
 geom_bar(stat="identity") +
 xlab("year") +
 ylab("PM 2.5 emissions from coal source in kilotons")+
 ggtitle("Total PM 2.5 emissions from coal source")
 
 dev.off()