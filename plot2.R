setwd("./Desktop/Coursera/ExploratoryDataAnalysis/Assignment")

# Read the RDS Summary and Source Classification code RDS files
sData <- readRDS("summarySCC_PM25.rds")
scCode <- readRDS("Source_Classification_Code.rds")

# Get Data for Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")
bltData <- subset(sData, fips == "24510")
# Calculate total for yearly emissions
png("plot2.png")
yearGrpData <- with(bltData,tapply(Emissions,year,sum))
plot(names(yearGrpData),yearGrpData,type="l",  xlab = "Year", ylab="PM2.5 Emission", main = "Total PM2.5 Emission  for Baltimore over Years", col = "Red")
dev.off()