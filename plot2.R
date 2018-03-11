NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- (subset(NEI,Emissions>0))[c(4,6)]

png("plot2.png", width=800, height=700)
barplot((tapply(baltimore$Emissions, baltimore$year , FUN="sum")),xlab="Year" , ylab="Emissions of PM2.5s" ,
        main="Emissions at baltimore in various years")
dev.off()