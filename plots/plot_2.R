library(dplyr)
library(chron)

plot_2 <- function(){
  file <- read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors = FALSE,na.strings = TRUE, dec =".")
  df <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]
  par(mfrow = c(1,1))
  
  
  date_time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  Global_active_power <- as.numeric(df$Global_active_power)
  plot(date_time,Global_active_power, type ="l", ylab =  "Global Active Power (Kilowats)", xlab ="")
  
  dev.copy(png, "plot2.png")
  dev.off()
}
