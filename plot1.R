# see complete source code at: https://github.com/andhdo/coursera_ds_exdata_project2

plot1 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # get the specific data to plot
  NEI <- load_data_nei()
  SCC <- load_data_scc()
  
  # names(NEI)
  # head(NEI)
  
  #precomputations
  
  # key sections are (1) the aggregated data
  processed_ds <- aggregate(Emissions ~ year, data=NEI, sum)
  
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot1.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  # key sections are (2) the usage of base-plotting-system
  plot( processed_ds, type="b", xlab = "Year", ylab = "PM")
  
  
  # Turn off deviceContext
  dev.off()
  
  
  
}