
  library(ggplot2)
  
  ## This first line will likely take a few seconds. Be patient!
  ## loading the raw data into memory
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  ##initializing vectors of the year and the types of emissions
  myYears <- c(1999, 2002, 2005, 2008)
  myTypes <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
  
  #dataframe for storing results
  myEmissionsDF <- data.frame(year=numeric(), type=character(), Emissions=numeric())
  
  #iterating through each combination of years and types to get all relevant data
  for( relYear in myYears){
    for (relType in myTypes){
     myDataSubset = subset(NEI, year==relYear & fips=="24510" & type==relType)
     relSum <- sum(myDataSubset$Emissions)
     myRelDF <- data.frame(year=relYear, type=relType, Emissions=relSum)
     myEmissionsDF <- rbind(myEmissionsDF, myRelDF) ##this is inefficient method called "growing an object"
    }
  }
  
  #Plotting the data 
  ggplot(data=myEmissionsDF, aes(x=year, y=Emissions, color = type, group = type)) + geom_point() + geom_line()
  ggsave("plot3.png")
