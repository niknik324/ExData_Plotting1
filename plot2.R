plot2 <- function() {
    
    btab <- read.table('household_power_consumption.txt', sep = ';', na.strings = '?', header=TRUE)
    btab$Date <- as.Date(btab$Date, format = "%d/%m/%Y")
    tab <- btab[((btab$Date=="2007-02-01")|(btab$Date=="2007-02-02")),]
    
    tab$DateTime <- as.POSIXct(strptime(paste(tab$Date, ' ',tab$Time), "%Y-%m-%d %H:%M:%S"))
    png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
    with(tab,plot(Global_active_power ~ DateTime, ylab = "Global Active Power (kilowatts)", type='l', xlab=NA))
    dev.off()
    
}
