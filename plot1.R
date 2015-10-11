plot1 <- function() {
    
    btab <- read.table('household_power_consumption.txt', sep = ';', na.strings = '?', header=TRUE)
    btab$Date <- as.Date(btab$Date, format = "%d/%m/%Y")
    tab <- btab[((btab$Date=="2007-02-01")|(btab$Date=="2007-02-02")),]
    
    png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
    with(tab,hist(Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global active power (kilowatts)'))
    dev.off()
    
}
