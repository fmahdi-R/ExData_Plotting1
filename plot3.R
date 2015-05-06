library(data.table)
plot3 <- function () {
    # Unzip, read Data Table initialize vars , etc ... 
    outpng <- "plot3.png"
    zipfile <- "./exdata_data_household_power_consumption.zip"
    unzippedf <- unzip(zipfile,list = )
    DT <- fread(unzippedf, na.strings = c("?"))

    #  - Add mDate column to use for subsetting , 
    #  - subset by mDate Feb 01 2007 and Feb 02 2007
    #  - Assign subset to MOD_DT
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]
    
    # Now create new column mDtTmChr - concatenate Date and Time
    MOD_DT[,mDtTmChr:=paste(Date,Time)]
    
    # Set variable for each column
    x1<- as.numeric(MOD_DT[,Sub_metering_1])
    x2<- as.numeric(MOD_DT[,Sub_metering_2])
    x3<- as.numeric(MOD_DT[,Sub_metering_3])
    d <- as.POSIXlt(MOD_DT[,mDtTmChr], format ="%d/%m/%Y %H:%M:%S")
    
    # Now plot 
    png(outpng,width = 480, height = 480, units = "px")
    plot(d,x1,xlab = "", ylab = "Energy sub metering", type = "l", col ="black")
    points(d,x2,xlab = "", ylab = "Energy sub metering", type = "l", col ="red")
    points(d,x3,xlab = "", ylab = "Energy sub metering", type = "l", col ="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c( "black","red","blue"),lty =1 )
    dev.off()
    
}