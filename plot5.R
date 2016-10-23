setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")
library(ggplot2)
library(dplyr)

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")

motorId <- grep("Vehicles",scCode$EI.Sector)
motorData <- scCode[motorId,]["SCC"]


yearGrp <- filter(sData,fips == "24510" & SCC %in% motorData$SCC) %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
png("plot5.PNG")
qplot(year,Emissions,data=yearGrp,geom = "line", color = "red")+ ggtitle("Motor Vehicle PM2.5 Emissions by Year")
dev.off()