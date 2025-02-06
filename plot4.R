mp4 <- function(){
  
  ## This first line will likely take a few seconds. Be patient!
  ##loading raw data into memory
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

  #making a vector of all coal related SCCs
  coalSCC <- subset(SCC, grepl("Coal", EI.Sector) & grepl("Comb", EI.Sector))
  sccCoalNumbers <- coalSCC$SCC
  #View(sccCoalNumbers)
  
  #subsetting coal combustion related data into each year 
  NEI99 <- subset(NEI, year==1999 & SCC %in% sccCoalNumbers)
  NEI02 <- subset(NEI, year==2002 & SCC %in% sccCoalNumbers)  
  NEI05 <- subset(NEI, year==2005 & SCC %in% sccCoalNumbers)
  NEI08 <- subset(NEI, year==2008 & SCC %in% sccCoalNumbers)
  
  #getting total coal related emissions for each year
  totalPM25In99 <- sum(NEI99$Emissions)
  totalPM25In02 <- sum(NEI02$Emissions)
  totalPM25In05 <- sum(NEI05$Emissions)
  totalPM25In08 <- sum(NEI08$Emissions)
  
  myYearsVector <- c(1999,2002,2005,2008)
  myEmissionsVector <- c(totalPM25In99, totalPM25In02, totalPM25In05, totalPM25In08)
  
  #Creating and labelling the 4th plot
  png('plot4.png')
  plot(myYearsVector, myEmissionsVector, xlab="Year", ylab="Total Coal Combustion Emissions", 
       pch=20, cex=2.5, main="Total Emissions From Coal Combustion Related Sources by Year")
  dev.off()
}