
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y" )
df$Time <- strptime(df$Time, "%H:%M:%S")


start <- as.Date("20070201", "%Y%m%d")
end <- as.Date("20070202", "%Y%m%d")
desiredData <- df[df$Date >= start & df$Date <= end,]

#Convert Global Active power to Numeric 
desiredData$Global_active_power <- as.numeric(as.character(desiredData$Global_active_power))

#Plot 1
#png(filename='plot1.png', width = 480 , height = 480, units ='px')
#hist(desiredData$Global_active_power, breaks=12, col ="red",xlab = "Global Active Power (killowatts)", main = "Global Active Power")
#dev.off()

#Plot 2
#png(filename='plot2.png', width = 480 , height = 480, units ='px')
#plot(desiredData$DateTime, desiredData$Global_active_power, type = "l",xlab ="",ylab = "Global Active Power (kilowatts)")
#dev.off()

#Plot 3
#png(filename='plot3.png', width = 480 , height = 480, units ='px')
#plot(desiredData$DateTime, desiredData$Sub_metering_1, type = "l",xlab ="",ylab = "Energy sub metering", col ="black")
#lines(desiredData$DateTime, desiredData$Sub_metering_2, col = "red")
#lines(desiredData$DateTime, desiredData$Sub_metering_3, col = "blue")
#legend("topright", pch ="__" ,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#dev.off()

#Plot 4
png(filename='plot4.png', width = 480 , height = 480, units ='px')
par(mfrow = c(2,2))
plot(desiredData$DateTime, desiredData$Global_active_power, type = "l",xlab ="",ylab = "Global Active Power (kilowatts)")
plot(desiredData$DateTime, desiredData$Voltage, type = "l",xlab ="datetime",ylab = "Voltage")
plot(desiredData$DateTime, desiredData$Sub_metering_1, type = "l",xlab ="",ylab = "Energy sub metering", col ="black")
lines(desiredData$DateTime, desiredData$Sub_metering_2, col = "red")
lines(desiredData$DateTime, desiredData$Sub_metering_3, col = "blue")
legend("topright", pch ="__" ,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(desiredData$DateTime, desiredData$Global_reactive_power, type = "l",xlab ="datetime",ylab = "Global_Reactive_Power")
dev.off()
