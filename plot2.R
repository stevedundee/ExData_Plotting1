plot2.R <- function() {
  require(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",sep=";","select * from file where Date in ('1/2/2007','2/2/2007')")
  png("plot2.png")
  data <- transform(data,DateTime = strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
  plot(data$DateTime,data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
  lines(data$DateTime,data$Global_active_power)
  dummy <- dev.off()
}
