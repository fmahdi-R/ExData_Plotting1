library(data.table)
plot4 <- function () {
    # Unzip, read Data Table initialize vars , etc ... 
    outpng <- "plot4.png"
    zipfile <- "./exdata_data_household_power_consumption.zip"
    unzippedf <- unzip(zipfile,list = )
    DT <- fread(unzippedf, na.strings = c("?"))
    #     MODT <- DT[,mDateTime:=paste(Date,Time)]
    #     MODT <- DT[,mTime:=strptime(Time,"%H:%M:%S")]

    #  - Add mDate column to use for subsetting , 
    #  - subset by mDate Feb 01 2007 and Feb 02 2007
    #  - Assign subset to MOD_DT
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]

    # Now create new column mDtTmChr - concatenate Date and Time
    MOD_DT[,mDtTmChr:=paste(Date,Time)]

    #MOD_DT

    
    png(outpng,width = 480, height = 480, units = "px")
    # We want 4 Plots 
    par(mfcol = c(2,2))
    
    #PLOT1 - set variables then plot
    x<- as.numeric(MOD_DT[,Global_active_power])
    d <- as.POSIXlt(MOD_DT[,mDtTmChr], format ="%d/%m/%Y %H:%M:%S")
    plot(d,x,xlab = "", ylab = "Global Active Power", type = "l")
    
    #PLOT2 - set variables then plot
    x1<- as.numeric(MOD_DT[,Sub_metering_1])
    x2<- as.numeric(MOD_DT[,Sub_metering_2])
    x3<- as.numeric(MOD_DT[,Sub_metering_3])
    plot(d,x1,xlab = "", ylab = "Energy sub metering", type = "l", col ="black")
    points(d,x2,xlab = "", ylab = "Energy sub metering", type = "l", col ="red")
    points(d,x3,xlab = "", ylab = "Energy sub metering", type = "l", col ="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c( "black","red","blue"),lty =1,bty = "n" )
    
    #PLOT3 - set variables then plot
    v <- as.numeric(MOD_DT[,Voltage])
    plot(d,v,xlab = "DateTime",  ylab = "Voltage", type = "l")
    
    #PLOT4 - set variables then plot
    grp <- as.numeric(MOD_DT[,Global_reactive_power])
    plot(d,grp,xlab = "DateTime",  ylab = "Global_reactive_power", type = "l")
    
    
    dev.off()
    
}