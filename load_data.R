# declare global names

target_zip_folder <- "exdata_data_NEI_data"
source_zip_file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
output_figures_folder <- "output_figures"

# download the file & uncompress it
download_raw_package <- function() {
  
  # set the download params
  
  target_zip_filename <- paste0(target_zip_folder,'.zip')
  
  # if extraction folder exists, skip
  if(!file.exists(target_zip_folder)) {
    
    if(!file.exists(target_zip_filename)) {
      download.file(source_zip_file,destfile=target_zip_filename)  
    } 
    unzip(target_zip_filename,exdir=target_zip_folder)
    
  }
  
}

install_required_packages <- function() {
  #if(!require("sqldf")) {
  #  install.packages("sqldf")
  #}
  
}

create_output_figures_folder <- function() {
  if(!file.exists(output_figures_folder)) {
    dir.create(output_figures_folder, showWarnings = FALSE)
  }
}

# load the prerrequisites
load_prerequisites <- function() {
  install_required_packages()
  download_raw_package()
  create_output_figures_folder()
}


load_data_nei <- function() {
  dataset_filename <- paste0(target_zip_folder,"/", "summarySCC_PM25.rds")
  variable_name <- "NEI" 
  if(!( exists(variable_name))) {
    # read the raw datasets
	  ## This first line will likely take a few seconds. Be patient!
	  NEI <- readRDS(dataset_filename)
  }
  else{
	# skip
  }
  NEI
}

load_data_scc <- function() {
  dataset_filename <- paste0(target_zip_folder,"/", "Source_Classification_Code.rds")
  variable_name <- "SCC" 
  if(!( exists(variable_name))) {
    # read the raw datasets
	  ## This first line will likely take a few seconds. Be patient!
	  SCC <- readRDS(dataset_filename)
  }
  else{
	# skip
  }
  SCC
}
