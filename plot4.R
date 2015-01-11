# load data
line1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1,skip=0)
header = colnames(line1)
d <- read.table("household_power_consumption.txt",sep=";",nrows=2*24*60,skip=66637,col.names=header)

d$Date <- weekdays(as.Date(d$Date,"%d/%m/%Y") )

#totally four plots 
par(mfrow = c(2,2))

#1 plot2 
plot(d$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))

#2 data$Voltage 
plot(d$Voltage,type="l", ylab="Voltage",xlab="datetime",xaxt="n")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))

#3 plot3 
plot(d$Sub_metering_1 ,type="l", ylab="Energy sub metering",col="black",xaxt="n",xlab="")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))
lines(d$Sub_metering_2,col="red")
lines(d$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#4 data$Global_reactive_power
plot(d$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))

# output png 
dev.copy(png, file = "plot4.png")  
dev.off()

#end 
