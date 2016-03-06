library(datasets)

#importing and filtering data
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
raw_data$Date<-strptime(raw_data$Date, "%d/%m/%Y")
d<-grepl(strptime("02/02/2007", "%d/%m/%Y"), raw_data$Date)
q<-grepl(strptime("01/02/2007", "%d/%m/%Y"), raw_data$Date)
data <- raw_data[d|q,]

#ploting data and saving plot
plot(as.numeric(as.character(data$Global_active_power)), type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = '', bg = "white")
axis(1, at = seq(0, 2900, by = 1450), label = c("Thu","Fri","Sat"))
dev.copy(png, file = "plot2.png")
dev.off()
