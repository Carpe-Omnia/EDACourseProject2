
  ## This first line will likely take a few seconds. Be patient!
  ##loading raw data into memory
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #making a vector of all coal related SCCs
  motorSCC <- subset(SCC, grepl("Mobile", EI.Sector))
  sccMotorNumbers <- motorSCC$SCC
  
  #subsetting motor vehicles related data into each year for Baltimore
  NEI99 <- subset(NEI, year==1999 & SCC %in% sccMotorNumbers & fips=="24510")
  NEI02 <- subset(NEI, year==2002 & SCC %in% sccMotorNumbers & fips=="24510")  
  NEI05 <- subset(NEI, year==2005 & SCC %in% sccMotorNumbers & fips=="24510")
  NEI08 <- subset(NEI, year==2008 & SCC %in% sccMotorNumbers & fips=="24510")
  
  #getting total motor vehicle related emissions for each year
  totalPM25In99 <- sum(NEI99$Emissions)
  totalPM25In02 <- sum(NEI02$Emissions)
  totalPM25In05 <- sum(NEI05$Emissions)
  totalPM25In08 <- sum(NEI08$Emissions)
  
  #making values into vectors for easier plotting
  myYearsVector <- c(1999,2002,2005,2008)
  myEmissionsVector <- c(totalPM25In99, totalPM25In02, totalPM25In05, totalPM25In08)
  
  #Creating and labelling the 5th plot
  png('plot5.png')
  plot(myYearsVector, myEmissionsVector, xlab="Year", ylab="Motor Vehicle Emissions", 
       pch=20, cex=2.5, main="Total Emissions From Motor Vehicles in Baltimore")
  dev.off()
