plot4.R <- function() {
  require(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",sep=";","select * from file where Date in ('1/2/2007','2/2/2007')")
 ### png("plot4.png")
  par(mfrow=c(2,2))
  data <- transform(data,DateTime = strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
  
  ## Chart 1
  plot(data$DateTime,data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
  lines(data$DateTime,data$Global_active_power)
  
  ## Chart 2
  plot(data$DateTime,data$Voltage,type="n",ylab="Voltage",xlab="datetime")
  lines(data$DateTime,data$Voltage)
 
  ## Chart 3
  plot(data$DateTime,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(data$DateTime,data$Sub_metering_1)
  lines(data$DateTime,data$Sub_metering_2,col="red")
  lines(data$DateTime,data$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
  
  ## Chart 4
  plot(data$DateTime,data$Global_reactive_power,type="n",ylab="Global Reactive Power (kilowatts)",xlab="datetime")
  lines(data$DateTime,data$Global_reactive_power)
 
 ### dummy <- dev.off()
}
