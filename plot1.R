setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")

png("plot1.png")
# Calculate total for yearly emissions
yearGrpData <- with(sData,tapply(Emissions,year,sum))
plot(names(yearGrpData),yearGrpData,type="l", xlab = "Year", ylab="PM2.5 Emission", main = "Total PM2.5 Emission over Years")
dev.off()

