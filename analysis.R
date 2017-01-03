library(dplyr)
read_text_file <- function(){

  file <- read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors = FALSE,na.strings = TRUE)
  
  
}


formatt_file <- function(file){
  transmute(file,Date = as.Date(Date), Global_active_power = as.numeric(Global_active_power))
  
}
