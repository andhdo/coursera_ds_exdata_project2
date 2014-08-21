# see complete source code at: https://github.com/andhdo/coursera_ds_exdata_project2
#
plot5 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # load libraries
  library(ggplot2)  
  
  # get the specific data to plot
  NEI <- load_data_nei()
  SCC <- load_data_scc()
  
  # names(NEI)
  # head(NEI)
  
  #precomputations
  
  # Key to this question is to explore the initial SCC data and go to find 
  #  the motor sources in the NEI dataset.
  # with an initial exploration, all motor vehicles seems to belong to the ON-ROAD type in 
  #  the original NEI dataset, so Only this filter will be considered
  #  in conjuntion with the city filter.
  #
  #    subsetSCCMotor <- SCC[grep("*Motor*|*Vehicle*", SCC$EI.Sector, ignore.case = TRUE),]
  #    subsetNEI     <- NEI[NEI$SCC %in% subsetSCCMotor$SCC , ] # and join with the filter: fips==24510
  
  subsetNEI     <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"), ]
  
  # then we can aggregate and plot the data

  processed_ds <- aggregate(Emissions ~ year , data=subsetNEI, sum) # + type
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot5.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  g <- ggplot(processed_ds, aes(x=year, y=Emissions)) #, group=type, colour=type
  g <- g + geom_point() + geom_line()
  g <- g + xlab("Year") + ylab("PM") + ggtitle("Motor Emissions [1999..2008] / Baltimore")
  
  # g <- g + geom_line() + geom_point() 
  # g <- g + facet_wrap(. ~ type)
  
  print(g)
  
  # Turn off deviceContext
  dev.off()
  
  
}