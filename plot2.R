# Exploratory data analysis - Week 1 - Plot 2

# Use the following command if you have used example(points) before
# grDevices::devAskNewPage(ask=FALSE)

# Read data from the webpage
# use http instead of https on Windows machine
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip", method="auto")
dateDownloaded <- date()
filein <- "household_power_consumption.zip"
fileout <- "household_power_consumption.txt"
data <- read.table(unzip(filein,fileout),header=TRUE,sep=";",stringsAsFactors=FALSE)
# stringsAsFactors=FALSE makes sure data is not read as factors

# or download and unpack zip file manually
# data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# look at data
# head(data)
# str(data)

# subset data
data_small <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

# check whether subsetting has worked properly
# head(data_small)

#convert date and time column into R date time format
data_small$datetime <- strptime(paste(data_small$Date,data_small$Time), "%d/%m/%Y %H:%M:%S")

# convert character data into numeric data
data_small$Global_active_power <- as.numeric(data_small$Global_active_power)

# produce plot 2, set parameters
file <- "plot2.png"
height <- 480
width <- 480
png(filename = file, height=height, width=width, units="px", bg="white") # opens file for png creation
# in case you need a transparent background, use bg = "transparent" 

# reset the graphics setting to one picture a page, set parameters
par(mfrow=c(1,1))
main <- ""
ylab <- "Global active power (kilowatts)"
xlab <- ""
type <- "line"
plot(data_small$datetime,data_small$Global_active_power, type=type,ylab=ylab,xlab=xlab,main=main)
dev.off() # close the graphics device