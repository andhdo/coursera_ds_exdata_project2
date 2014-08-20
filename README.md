# ExDataPlotting Project 2

## Execution

1. Download the remote files and load the process variables (NEI,SCC). 
   Use the following instructions for this purpose.
   It creates a subdirectory with the name of the zip and without extension.
   Also it puts the readed information to the R environment
´´´
source("load_data.R")
load_prerequisites()
NEI <- load_data_nei()
SCC <- load_data_scc()
´´´

2. Execute each plot with the following code. varying the index of the figures
´´´
source("plot1.R")
plot1()
´´´
3. View the results in the "output_figures" folder


