plot1.R <- function() {
  require(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",sep=";","select * from file where Date in ('1/2/2007','2/2/2007')")
  png("plot1.png")
  hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
  dummy <- dev.off()
}
