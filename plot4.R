plot4 <- function() {
    
    btab <- read.table('household_power_consumption.txt', sep = ';', na.strings = '?', header=TRUE)
    btab$Date <- as.Date(btab$Date, format = "%d/%m/%Y")
    tab <- btab[((btab$Date=="2007-02-01")|(btab$Date=="2007-02-02")),]
    
    tab$DateTime <- as.POSIXct(strptime(paste(tab$Date, ' ',tab$Time), "%Y-%m-%d %H:%M:%S"))
    png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
        par(mfcol=c(2,2))
        
        with(tab,plot(Global_active_power ~ DateTime, ylab = "Global Active Power", type='l', xlab=NA))
        
        with(tab,plot(Sub_metering_1 ~ DateTime, ylab = "Energy sub metering", type='n', xlab=NA))
        with(tab,lines(Sub_metering_1 ~ DateTime, col="black", ylab = "Energy sub metering", xlab=NA))
        with(tab,lines(Sub_metering_2 ~ DateTime, col="red", ylab = "Energy sub metering", xlab=NA))
        with(tab,lines(Sub_metering_3 ~ DateTime, col="blue", ylab = "Energy sub metering", xlab=NA))
        legend('topright', bty = 'n', col=c("black", "red", "blue"), lty=1, legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
        
        with(tab,plot(Voltage ~ DateTime, ylab = "Voltage", type='l', xlab='DateTime'))
        
        with(tab,plot(Global_reactive_power ~ DateTime, ylab = "Global_reactive_power", type='l', xlab='DateTime'))
        
    dev.off()
    
}