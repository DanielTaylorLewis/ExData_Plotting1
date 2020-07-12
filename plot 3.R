#Plot 3

library(ggplot2)
library(gridExtra)
library(dplyr)

elec_data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
elec_data$Date<-as.Date(elec_data$Date,"%d/%m/%Y")
elec_data_filt<-elec_data[(elec_data$Date>="2007-02-01" & elec_data$Date<="2007-02-02"),]
elec_data_filt$datetime<-paste(elec_data_filt$Date,as.character(elec_data_filt$Time))
elec_data_filt$datetime<-as.POSIXct(elec_data_filt$datetime)



sub1<-elec_data_filt[,c("datetime","Sub_metering_1")]
names(sub1)<-c("datetime","Sub_metering")
sub1$sub_factor="Sub_metering_1"
sub2<-elec_data_filt[,c("datetime","Sub_metering_2")]
names(sub2)<-c("datetime","Sub_metering")
sub2$sub_factor="Sub_metering_2"
sub3<-elec_data_filt[,c("datetime","Sub_metering_3")]
names(sub3)<-c("datetime","Sub_metering")
sub3$sub_factor="Sub_metering_3"

elec_data_filt_sub<-rbind(sub1,sub2,sub3)


p3<-ggplot(elec_data_filt_sub, aes(datetime, Sub_metering, colour = factor(sub_factor) ))+
    geom_line()+
    scale_x_datetime(date_labels ="%a",date_breaks = "1 day")+
    labs(y="Energy Sub Metering",x="")+
    theme(legend.title = element_text(size=0),
          legend.position = c(.95, .95),
          legend.justification = c("right", "top"),
          legend.box.just = "right",
          legend.margin = margin(6, 6, 6, 6)
    )


ggsave(p3,file="C:/Users/Dan/Documents/Coursera/EDA/Week 1/Cloned Repo/ExData_Plotting1/plot3.png")
