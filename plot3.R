# see complete source code at: https://github.com/andhdo/coursera_ds_exdata_project2

plot3 <- function() {
  
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
  
  # wee need to load ggplot2 library and include the type inside the dataset
  subsetNEI = subset(NEI, fips==24510) # NEI[NEI$fips=="24510",]
  
  processed_ds <- aggregate(Emissions ~ year + type, data=subsetNEI, sum)
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot3.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  # ...and use ggplot to load the graphic, using the color as aesthetic feature to show emission types.
  g <- ggplot(processed_ds, aes(x=year, y=Emissions, group=type, colour=type))
  g <- g + geom_point() + geom_line()
  g <- g + xlab("Year") + ylab("PM") + ggtitle("Emissions in Baltimore [1999..2008]")
  
  # g <- g + geom_line() + geom_point() 
  # g <- g + facet_wrap(. ~ type)
  
  print(g)
  
  # Turn off deviceContext
  dev.off()
  
  
}