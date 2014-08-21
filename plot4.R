# see complete source code at: https://github.com/andhdo/coursera_ds_exdata_project2
#
plot4 <- function() {
  
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
  
  #subsetSCCcoal = #SCC[grep("^Coal ", SCC$Short.Name, ignore.case=F),"SCC"] #subset(NEI, fips==24510) # NEI[NEI$fips=="24510",]
  
  # Key to this question is subsetting the original
  # is subset the SCC data and go to find the coal sources in the NEI dataset
  
  subsetSCCcoal <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE),]
  subsetNEI     <- NEI[NEI$SCC %in% subsetSCCcoal$SCC, ]
  
  # then we can aggregate the data to be shown

  processed_ds <- aggregate(Emissions ~ year , data=subsetNEI, sum) # + type
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot4.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # process information to produce graphic
  g <- ggplot(processed_ds, aes(x=year, y=Emissions)) #, group=type, colour=type
  g <- g + geom_point() + geom_line()
  g <- g + xlab("Year") + ylab("PM") + ggtitle("Coal Emissions [1999..2008] / All U.S.")
  
  # g <- g + geom_line() + geom_point() 
  # g <- g + facet_wrap(. ~ type)
  
  print(g)
  
  # Turn off deviceContext
  dev.off()
  
  
}