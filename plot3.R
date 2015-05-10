plot3.R <- function() {
  require(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",sep=";","select * from file where Date in ('1/2/2007','2/2/2007')")
  png("plot3.png")
  data <- transform(data,DateTime = strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
  plot(data$DateTime,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(data$DateTime,data$Sub_metering_1)
  lines(data$DateTime,data$Sub_metering_2,col="red")
  lines(data$DateTime,data$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
  dummy <- dev.off()
}
