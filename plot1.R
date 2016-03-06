library(datasets)

#importing and filtering data
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
raw_data$Date<-strptime(raw_data$Date, "%d/%m/%Y")
d<-grepl(strptime("02/02/2007", "%d/%m/%Y"), raw_data$Date)
q<-grepl(strptime("01/02/2007", "%d/%m/%Y"), raw_data$Date)
data <- raw_data[d|q,]

#ploting data and saving plot
 hist(as.numeric(as.character(data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
