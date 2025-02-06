
  ## This first line will likely take a few seconds. Be patient!
  ##loading raw data into memory
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  #making a vector of all coal related SCCs
  motorSCC <- subset(SCC, grepl("Mobile", EI.Sector))
  sccMotorNumbers <- motorSCC$SCC
  
  #subsetting motor vehicles related data into each year for Baltimore
  NEI99b <- subset(NEI, year==1999 & SCC %in% sccMotorNumbers & fips=="24510")
  NEI02b <- subset(NEI, year==2002 & SCC %in% sccMotorNumbers & fips=="24510")  
  NEI05b <- subset(NEI, year==2005 & SCC %in% sccMotorNumbers & fips=="24510")
  NEI08b <- subset(NEI, year==2008 & SCC %in% sccMotorNumbers & fips=="24510")
  
  #subsetting motor vehicles related data into each year for LA
  NEI99l <- subset(NEI, year==1999 & SCC %in% sccMotorNumbers & fips=="06037")
  NEI02l <- subset(NEI, year==2002 & SCC %in% sccMotorNumbers & fips=="06037")  
  NEI05l <- subset(NEI, year==2005 & SCC %in% sccMotorNumbers & fips=="06037")
  NEI08l <- subset(NEI, year==2008 & SCC %in% sccMotorNumbers & fips=="06037")
  
  #getting total motor vehicle related emissions for each year in Baltimore
  totalPM25In99b <- sum(NEI99b$Emissions)
  totalPM25In02b <- sum(NEI02b$Emissions)
  totalPM25In05b <- sum(NEI05b$Emissions)
  totalPM25In08b <- sum(NEI08b$Emissions)
  
  #getting total motor vehicle related emissions for each year in Baltimore
  totalPM25In99l <- sum(NEI99l$Emissions)
  totalPM25In02l <- sum(NEI02l$Emissions)
  totalPM25In05l <- sum(NEI05l$Emissions)
  totalPM25In08l <- sum(NEI08l$Emissions)
  
  #making values into vectors for easier plotting
  myYearsVector <- c(1999,2002,2005,2008)
  myBaltimoreEmissions <- c(totalPM25In99b, totalPM25In02b, totalPM25In05b, totalPM25In08b)
  myLAEmissions <- c(totalPM25In99l, totalPM25In02l, totalPM25In05l, totalPM25In08l)
  
  ##plotting both sets of values side by side for comparison
  png('plot6.png')
  par(mfrow = c(1, 2))
  plot(myYearsVector, myBaltimoreEmissions, col="purple", main="BA MV Emissions", xlab="", ylab="tons pm25", pch=20, cex=2.5 )
  plot(myYearsVector, myLAEmissions, col="blue", main="LA MV Emissions", xlab="", ylab="tons pm25", pch=20, cex=2.5)
  dev.off()
