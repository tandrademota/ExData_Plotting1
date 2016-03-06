library(datasets)

#importing and filtering data
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
raw_data$Date<-strptime(raw_data$Date, "%d/%m/%Y")
d<-grepl(strptime("02/02/2007", "%d/%m/%Y"), raw_data$Date)
q<-grepl(strptime("01/02/2007", "%d/%m/%Y"), raw_data$Date)
data <- raw_data[d|q,]

#ploting data and saving plot
with(data,plot(as.numeric(as.character(data$Sub_metering_1)), type = "l", xaxt = "n", ylab = "Enegy sub metering", xlab = ''))
with(data, lines(as.numeric(as.character(data$Sub_metering_2)), col = "red"))
with(data, lines(as.numeric(as.character(data$Sub_metering_3)), col = "blue"))
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
