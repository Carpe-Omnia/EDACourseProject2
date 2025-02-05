mp2 <- function(){
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #subsetting Data into each year 
  NEI99 <- subset(NEI, year==1999 & fips=="24510")
  NEI02 <- subset(NEI, year==2002 & fips=="24510")  
  NEI05 <- subset(NEI, year==2005 & fips=="24510")
  NEI08 <- subset(NEI, year==2008 & fips=="24510")
  
  #getting total emissions for each year
  totalPM25In99 <- sum(NEI99$Emissions)
  totalPM25In02 <- sum(NEI02$Emissions)
  totalPM25In05 <- sum(NEI05$Emissions)
  totalPM25In08 <- sum(NEI08$Emissions)
  
  #making vectors out of the year and emissions data
  myYearsVector <- c(1999,2002,2005,2008)
  myEmissionsVector <- c(totalPM25In99, totalPM25In02, totalPM25In05, totalPM25In08)
  
  #Creating and labelling the 2nd plot
  png('plot2.png')
  plot(myYearsVector, myEmissionsVector, xlab="Year", ylab="Total Emissions In Baltimore (tons of PM25)", 
       pch=20, cex=5, main="Total PM25 Emissions in Baltimore by Year")
  dev.off()
  
}