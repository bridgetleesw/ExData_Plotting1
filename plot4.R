# read data
data <- read.csv("~/household_power_consumption.txt", sep=";")

# convert and subset Date column
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# convert and subset Time column
data_subset$datetime <- paste(data_subset$Date, data_subset$Time)
data_subset$datetime <- strptime(data_subset$datetime, format='%Y-%m-%d %H:%M:%S')


# plot 4
par(mfrow=c(2,2))

with(data_subset, {
  plot(datetime, Global_active_power, xlab='', ylab='Global Active Power', type='l')
  plot(datetime, Voltage, xlab='datetime', ylab='Voltage', type='l')
  plot(data_subset$datetime, data_subset$Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='')
  lines(data_subset$datetime, data_subset$Sub_metering_2, type='l', col='red')
  lines(data_subset$datetime, data_subset$Sub_metering_3, type='l', col='blue')
  legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , col = c('black','red','blue'),lty=1,bty = "n" ,bg="transparent", cex=0.5)
  plot(datetime, Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
})


dev.copy(png,'plot4.png',
         width = 480, height = 480)
dev.off()
