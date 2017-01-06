library(dplyr)
library(chron)

plot_4 <- function(){
  file <- read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors = FALSE,na.strings = TRUE, dec =".")
  
  df <- file[file$Date %in% c("1/2/2007","2/2/2007") ,] 
  par(mfrow = c(2,2))
  date_time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  Global_active_power <- as.numeric(df$Global_active_power)
  
  
  Sub_metering_1 <- as.numeric(df$Sub_metering_1)
  Sub_metering_2 <- as.numeric(df$Sub_metering_2)
  Sub_metering_3 <- as.numeric(df$Sub_metering_3)
  

  plot(date_time,Global_active_power, type ="l", ylab =  "Global Active Power (Kilowats)", xlab ="")
  
  plot(date_time,as.numeric(df$Voltage), type ="l", ylab =  "Voltage", xlab ="datetime")
  
  
  plot(date_time,Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(date_time,Sub_metering_2, type ="l", col = "red")
  lines(date_time,Sub_metering_3, type ="l", col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 1)
  
  
  plot(date_time,as.numeric(df$Global_reactive_power), type ="l", ylab =  "Global Reactive Power (Kilowats)", xlab ="datetime")
  dev.copy(png, "plot4.png")
  dev.off()
  }
