setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")
library(ggplot2)
library(dplyr)

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")

coalSource <- subset(scCode, EI.Sector %in% c("Fuel Comb - Electric Generation - Coal","Fuel Comb - Industrial Boilers, ICEs - Coal","Fuel Comb - Comm/Institutional - Coal"))

allData <- merge(sData,coalSource,by = "SCC")

grpData <- allData %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
png("plot4.PNG")
qplot(year,Emissions,data=grpData,geom = "line", color = "red")+ ggtitle("Coal combustion Emissions between 1999 to 2008")
dev.off()