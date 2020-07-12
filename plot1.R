#Plot 1

library(ggplot2)
library(gridExtra)
library(dplyr)

elec_data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
elec_data$Date<-as.Date(elec_data$Date,"%d/%m/%Y")
elec_data_filt<-elec_data[(elec_data$Date>="2007-02-01" & elec_data$Date<="2007-02-02"),]
elec_data_filt$datetime<-paste(elec_data_filt$Date,as.character(elec_data_filt$Time))
elec_data_filt$datetime<-as.POSIXct(elec_data_filt$datetime)

p1<-elec_data_filt%>%
    ggplot(aes(x=Global_active_power))+
    geom_histogram(breaks=seq(0,8,0.5),fill="red",colour="black")+labs(title="Global Active Power",x="Global Active Power (Kilowatts)",y="Frequency")
ggsave(p1,file="C:/Users/Dan/Documents/Coursera/EDA/Week 1/Cloned Repo/ExData_Plotting1/plot1.png")