plot1 <- function () {
    outpng <- "plot1.png"
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]

    #MOD_DT
    x<- as.numeric(MOD_DT[,Global_active_power])
    png(outpng,width = 480, height = 480, units = "px")
    hist(x,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
    dev.off()
    
}