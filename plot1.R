#ExData_plotting1 plot1.R => plot1.png

# load data
line1 = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1,skip=0)
header = colnames(line1)
d <- read.table("household_power_consumption.txt",sep=";",nrows=2*24*60,skip=66637,col.names=header)

# plot
hist(d$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",bty = "n")

# output png 
dev.copy(png, file = "plot1.png")  
dev.off()


# end