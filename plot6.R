# see complete source code at: https://github.com/andhdo/coursera_ds_exdata_project2
#
plot6 <- function() {
  
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
  
  # Similar to exercise 5, we are going to select the cities with the fips code
  #   and aggregate the data of the two populations
  
  subsetNEI     <- NEI[(NEI$fips %in% c("24510","06037")) & (NEI$type=="ON-ROAD"), ]
  
  # then we can aggregate and plot the data

  processed_ds <- aggregate(Emissions ~ year+fips , data=subsetNEI, sum) # + type
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot6.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  g <- ggplot(processed_ds, aes(x=year, y=Emissions, group=fips, colour=fips)) #, group=type, colour=type
  g <- g + geom_point() + geom_line()
  g <- g + xlab("Year") + ylab("PM") + ggtitle("Motor Emissions [1999..2008] / Baltimore & LosAngeles")
  g <- g + scale_colour_discrete(label = c("LosAngeles","Baltimore")) # change legend labels
  
  print(g)
  
  # Turn off deviceContext
  dev.off()
  
  
}