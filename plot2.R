########
## Script to extract the Global Active Power data from 2/1/2007 to 2/2/2007 and generate
## a histogram of the values
########
## Extract relevant rows from the dataset
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
## Add column names
colnames(my_data) <- c("Date", "Time", "Active")
## Change Date column from character to date
my_data[, 1] <- as.Date(my_data[, 1], format="%d/%m/%Y")
## add a column that combines date and time
my_data$dateTime <- as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")
## open PNG device
png(filename = "plot2.png", width = 480, height = 480)
## Generate a line plot of Global Active Power vs. Day using labels, title, and color per specification
plot(Active ~ dateTime, my_data, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')
## Close the PNG device
dev.off()