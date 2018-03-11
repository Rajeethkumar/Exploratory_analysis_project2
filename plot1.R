NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png", width=800, height=700)
barplot((tapply(NEI$Emissions, NEI$year , FUN="sum")),xlab="years", ylab="Emission" ,
        main="Emissions at various years")
dev.off()