library(datasets)

#importing and filtering data
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
raw_data$Date<-strptime(raw_data$Date, "%d/%m/%Y")
d<-grepl(strptime("02/02/2007", "%d/%m/%Y"), raw_data$Date)
q<-grepl(strptime("01/02/2007", "%d/%m/%Y"), raw_data$Date)
data <- raw_data[d|q,]

#ploting data and saving plot
par(mfrow = c(2, 2))

#first sub graph
plot(as.numeric(as.character(data$Global_active_power)), type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = '')
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))

#second sub graph
plot(as.numeric(as.character(data$Voltage)), type = "l", xaxt = "n", ylab = "Voltage", xlab = 'datetime')
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))

#third sub graph
with(data,plot(as.numeric(as.character(data$Sub_metering_1)), type = "l", xaxt = "n", ylab = "Enegy sub metering", xlab = ''))
with(data, lines(as.numeric(as.character(data$Sub_metering_2)), col = "red"))
with(data, lines(as.numeric(as.character(data$Sub_metering_3)), col = "blue"))
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#fourth subgraph
plot(as.numeric(as.character(data$Global_reactive_power)), type = "l", xaxt = "n", ylab = "Global Reactive Power", xlab = 'datetime')
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))

#saving...
dev.copy(png, file = "plot4.png")
dev.off()
