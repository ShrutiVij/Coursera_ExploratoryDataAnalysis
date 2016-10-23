setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")
library(ggplot2)
library(dplyr)

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")


# Calculate total for yearly emissions for Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺
grpData <- filter(sData,fips == "24510") %>% group_by(year,type) %>% summarise(Emissions=sum(Emissions))

png("plot3.PNG")
qplot(year,Emissions,data=grpData,color = type,geom = "line") + ggtitle("Total PM2.5 Emission for Baltimore by type")
dev.off()