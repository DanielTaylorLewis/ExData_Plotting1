#Plot 2

library(ggplot2)
library(gridExtra)
library(dplyr)

elec_data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
elec_data$Date<-as.Date(elec_data$Date,"%d/%m/%Y")
elec_data_filt<-elec_data[(elec_data$Date>="2007-02-01" & elec_data$Date<="2007-02-02"),]
elec_data_filt$datetime<-paste(elec_data_filt$Date,as.character(elec_data_filt$Time))
elec_data_filt$datetime<-as.POSIXct(elec_data_filt$datetime)

p2<-elec_data_filt%>%ggplot()+
    scale_x_datetime(date_labels ="%a",date_breaks = "1 day")+
    geom_line(aes(x=datetime,y=Global_active_power))+
    labs(y="Global active power (kilowatts)",x="")

ggsave(p2,file="C:/Users/Dan/Documents/Coursera/EDA/Week 1/Cloned Repo/ExData_Plotting1/plot2.png")