mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
mydata$DateTime<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydatasub<-subset(mydata, DateTime >= "2007-02-01" & DateTime <= "2007-02-02")

png("plot4.png")

par(mfrow=c(2,2))

plot(x=mydatasub$DateTime, y=mydatasub$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

plot(x=mydatasub$DateTime, y=mydatasub$Voltage, type="l", 
     xlab="DateTime", ylab="Voltage")

plot(mydatasub$DateTime, mydatasub$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(mydatasub$DateTime, mydatasub$Sub_metering_2,type="l",col="red")
lines(mydatasub$DateTime, mydatasub$Sub_metering_3,type="l",col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(mydatasub$DateTime, mydatasub$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")


while (!is.null(dev.list()))  dev.off()