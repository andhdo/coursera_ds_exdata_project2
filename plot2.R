plot2 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # get the specific data to plot
  NEI <- load_data_nei()
  SCC <- load_data_scc()
  
  # names(NEI)
  # head(NEI)
  
  #precomputations
  
  subsetNEI = subset(NEI, fips==24510) # NEI[NEI$fips=="24510",]
  
  processed_ds <- aggregate(Emissions ~ year, data=subsetNEI, sum)
  
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot2.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  plot( processed_ds, type="b", xlab = "Year", ylab = "PM",
    main='PM emission per year for Baltimore City(fips == "24510")')
  
  
  # Turn off deviceContext
  dev.off()
  
  
  
}