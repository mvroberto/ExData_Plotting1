library(dplyr)
library(chron)


plot_1 <- function(){
  par(mfrow = c(1,1))
  
  file <- read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors = FALSE,na.strings = TRUE, dec =".")
  data <- transmute(file,Date = as.Date(Date, format = "%d/%m/%Y"),Global_active_power = as.numeric(Global_active_power))
  filtered_data <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  hist(filtered_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")
  dev.copy(png, "plot1.png")
  dev.off()
  
}
