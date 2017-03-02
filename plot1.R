
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
png(filename='plot1.png', width = 480 , height = 480, units ='px')
hist(desiredData$Global_active_power, breaks=12, col ="red",xlab = "Global Active Power (killowatts)", main = "Global Active Power")
dev.off()

#Plot 2
png(filename='plot2.png', width = 480 , height = 480, units ='px')
plot(desiredData$DateTime, desiredData$Global_active_power, type = "l",xlab ="",ylab = "Global Active Power (kilowatts)")
dev.off()