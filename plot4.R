########
## Script to extract data from 2/1/2007 to 2/2/2007 and generate
## four plots for data over the time period specified
########
## Extract relevant rows from the dataset
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
## Add column names
colnames(my_data) <- c("Date", "Time", "Active", "Reactive", "Voltage", "Intensity", "Sub1", "Sub2", "Sub3")
## Change Date column from character to date
my_data[, 1] <- as.Date(my_data[, 1], format="%d/%m/%Y")
## add a column that combines date and time
my_data$dateTime <- as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")
## open PNG device
png(filename = "plot4.png", width = 480, height = 480)
## Set up 4 plot window
par(mfrow = c(2, 2))
## Generate a line plot of Global Active Power vs. Day using labels, title, and color per specification
plot(Active ~ dateTime, my_data, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')
plot(Voltage ~ dateTime, my_data, xlab = "datetime", ylab = "Voltage", type = 'l')
plot(Sub1 ~ dateTime, my_data, xlab = "", ylab = "Energy sub metering", type = 'l')
lines(Sub2 ~ dateTime, my_data, type = 'l', col = "red")
lines(Sub3 ~ dateTime, my_data, type = 'l', col = "blue")
legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Reactive ~ dateTime, my_data, xlab = "datetime", ylab = "Global_reactive_power", type = 'l')
## Close the PNG device
dev.off()