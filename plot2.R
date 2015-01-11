#ExData_plotting1 plot2.R => plot2.png

# load data
line1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1,skip=0)
header = colnames(line1)
d <- read.table("household_power_consumption.txt",sep=";",nrows=2*24*60,skip=66637,col.names=header)

datetime <- weekdays(strptime(paste(d$Date, d$Time),'%d/%m/%Y %H:%M:%S'))

# plot  
plot(d$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1,at = c(0,1*24*60,2*24*60),labels=c("Thu","Fri","Sat"))

# output png 
dev.copy(png, file = "plot2.png")  
dev.off()

# end