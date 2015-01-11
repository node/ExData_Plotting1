# load data
line1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1,skip=0)
header = colnames(line1)
d <- read.table("household_power_consumption.txt",sep=";",nrows=2*24*60,skip=66637,col.names=header)

d$Date <- weekdays(as.Date(d$Date,"%d/%m/%Y",tz="UTC") )
d$Time <- strptime(d$Time)

datetime <- strptime(paste(data$Date, data$Time),'%d/%m/%Y %H:%M:%S')

# plot  
plot(d$Sub_metering_1 ,type="l", ylab="Energy sub metering",col="black",xaxt="n")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))
lines(d$Sub_metering_2,col="red")
lines(d$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

# output png 
dev.copy(png, file = "plot3.png")  
dev.off()

#end