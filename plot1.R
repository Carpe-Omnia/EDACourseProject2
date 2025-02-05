  ## This first line will likely take a few seconds. Be patient!
  ##loading raw data into memory
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #subsetting Data into each year 
  NEI99 <- subset(NEI, year==1999)
  NEI02 <- subset(NEI, year==2002)  
  NEI05 <- subset(NEI, year==2005)
  NEI08 <- subset(NEI, year==2008)
  
  #getting total emissions for each year
  totalPM25In99 <- sum(NEI99$Emissions)
  totalPM25In02 <- sum(NEI02$Emissions)
  totalPM25In05 <- sum(NEI05$Emissions)
  totalPM25In08 <- sum(NEI08$Emissions)

  myYearsVector <- c(1999,2002,2005,2008)
  myEmissionsVector <- c(totalPM25In99, totalPM25In02, totalPM25In05, totalPM25In08)
  
  #Creating and labelling the 1st plot
  png('plot1.png')
  plot(myYearsVector, myEmissionsVector, xlab="Year", ylab="Total Emissions", 
       pch=20, cex=5, main="Total PM25 Emissions From All Sources by Year")
  dev.off()