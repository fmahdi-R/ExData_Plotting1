plot4 <- function () {
    outpng <- "plot4.png"
    #     MODT <- DT[,mDateTime:=paste(Date,Time)]
    #     MODT <- DT[,mTime:=strptime(Time,"%H:%M:%S")]
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]
    MOD_DT[,Day:=as.Date(Date,"%a")]
    MOD_DT[,mDtTmChr:=paste(Date,Time)]
    #MOD_DT
    x1<- as.numeric(MOD_DT[,Sub_metering_1])
    x2<- as.numeric(MOD_DT[,Sub_metering_2])
    x3<- as.numeric(MOD_DT[,Sub_metering_3])
    d <- as.POSIXlt(MOD_DT[,mDtTmChr], format ="%d/%m/%Y %H:%M:%S")
    
    png(outpng,width = 480, height = 480, units = "px")
    par(mfcol = c(2,2))
    #PLOT1
    x<- as.numeric(MOD_DT[,Global_active_power])
    plot(d,x,xlab = "", ylab = "Global Active Power", type = "l")
    
    #PLOT2
    plot(d,x1,xlab = "", ylab = "Energy sub metering", type = "l", col ="black")
    points(d,x2,xlab = "", ylab = "Energy sub metering", type = "l", col ="red")
    points(d,x3,xlab = "", ylab = "Energy sub metering", type = "l", col ="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c( "black","red","blue"),lty =1,bty = "n" )
    
    #PLOT3
    v <- as.numeric(MOD_DT[,Voltage])
    plot(d,v,xlab = "DateTime",  ylab = "Voltage", type = "l")
    #PLOT4
    grp <- as.numeric(MOD_DT[,Global_reactive_power])
    plot(d,grp,xlab = "DateTime",  ylab = "Global_reactive_power", type = "l")
    
    
    dev.off()
    
}