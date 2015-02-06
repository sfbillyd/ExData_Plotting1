########
## Script to extract the Global Active Power data from 2/1/2007 to 2/2/2007 and generate
## a histogram of the values
########
## Extract relevant rows from the dataset
my_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", skip = 66636, nrows = 2880)
## Create a vector out of the values from the Global Active Power column (3)
x <- my_data[[3]]
## Generate a histogram of the values using labels, title, and color per specification
hist(x, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")
## Close the PNG device
dev.off()