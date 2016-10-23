setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")
library(ggplot2)
library(dplyr)

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")

motorId <- grep("Vehicles",scCode$EI.Sector)
motorData <- scCode[motorId,]["SCC"]


yearGrpBlt <- filter(sData,fips == "24510" & SCC %in% motorData$SCC) %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
yearGrpClf <- filter(sData,fips == "06037" & SCC %in% motorData$SCC) %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

png("plot6.PNG")
ggplot(yearGrpBlt,aes(year,Emissions))+
    geom_line(aes(color = "Baltimore"))+
    geom_line(data=yearGrpClf,aes(color="California"))
dev.off()