getwd()
mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

mydata$DateTime<-strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
mydatasub<-subset(mydata, DateTime >= "2007-02-01" & DateTime <= "2007-02-02")
mydatasub$Global_active_power<-as.numeric(mydatasub$Global_active_power)

png("plot1.png")
hist(mydatasub$Global_active_power, 
     main="Global Active Power",xlab="Global Active Power (kilowatts)",  col="Red")
dev.off
while (!is.null(dev.list()))  dev.off()

