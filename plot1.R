
# read data
data <- read.csv("~/household_power_consumption.txt", sep=";")

# convert and subset Date column
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# convert and subset Time column
data_subset$datetime <- paste(data_subset$Date, data_subset$Time)
data_subset$datetime <- strptime(data_subset$datetime, format='%Y-%m-%d %H:%M:%S')


# plot
hist(as.numeric(data_subset$Global_active_power), col='red'
     , main='Global Active Power'
     , xlab='Global Active Power (kilowatts)'
     , ylim = range(0,1200,200))


dev.copy(png,'plot1.png',
         width = 480, height = 480)
dev.off()
