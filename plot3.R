# Exploratory data analysis - Week 1 - Plot 3

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
data_small$Sub_metering_1 <- as.numeric(as.character(data_small$Sub_metering_1))
data_small$Sub_metering_2 <- as.numeric(as.character(data_small$Sub_metering_2))
data_small$Sub_metering_3 <- as.numeric(as.character(data_small$Sub_metering_3))

# produce plot 3, set parameter
file <- "plot3.png"
height <- 480
width <- 480
png(filename = file, height=height, width=width, units="px", bg="white") # opens file for png creation
# in case you need a transparent background, use bg = "transparent" 

# reset the graphics setting to one picture a page, set parameters
par(mfrow=c(1,1))
col1 <- "black"
col2 <- "red"
col3 <- "blue"
ylim <- c(0,35) 
ylab <- "Energy sub metering"
xlab <- ""
main <- ""
plot(data_small$datetime,data_small$Sub_metering_1, type=type, col=col1,ylab=ylab, xlab=xlab, main=main)
lines(data_small$datetime,data_small$Sub_metering_2, col=col2)
lines(data_small$datetime,data_small$Sub_metering_3, col=col3)
position <- "topright"
names <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend(position,names,col=c(col1,col2,col3),lty=1)
# lty=1 produces lines in legend
dev.off() # close the graphics device