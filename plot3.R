########
## Script to extract the Global Active Power data from 2/1/2007 to 2/2/2007 and generate
## a line chart of the 3 sub-metering readings over the period specified.
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
png(filename = "plot3.png", width = 480, height = 480)
## Generate a line plot of Global Active Power vs. Day using labels, title, and color per specification
#plot(Active ~ dateTime, my_data, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'n')
plot(Sub1 ~ dateTime, my_data, xlab = "", ylab = "Energy sub metering", type = 'l')
lines(Sub2 ~ dateTime, my_data, type = 'l', col = "red")
lines(Sub3 ~ dateTime, my_data, type = 'l', col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Close the PNG device
dev.off()