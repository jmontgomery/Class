setwd("~/Desktop/Research/Budgets") # Setting working directory

budgets <- read.csv("master state budget data.csv", header=T, stringsAsFactors=FALSE)


subset <- budgets[which(budgets$agency == "Judiciary"),]

subset

subset$govreq <- gsub('\\$', '', subset$govreq)
subset$govreq <- gsub(',', '', subset$govreq)
subset$enacted <- gsub('\\$', '', subset$enacted)
subset$enacted <- gsub(',', '', subset$enacted)

subset$enacted <- as.numeric(subset$enacted)
subset$govreq <- as.numeric(subset$govreq)

library(lubridate); library(dplyr); library(RCurl)
monthly_cpi <- getURL("https://research.stlouisfed.org/fred2/data/CPIAUCSL.csv")
monthly_cpi <- read.csv(text=monthly_cpi)
monthly_cpi$cpi_year <- year(monthly_cpi$DATE)
yearly_cpi <- monthly_cpi %>% group_by(cpi_year) %>% summarize(cpi = mean(VALUE))
yearly_cpi$adj_factor <- yearly_cpi$cpi/yearly_cpi$cpi[yearly_cpi$cpi_year == 2015]

subset$govreqadj <- subset$enactedadj <-  rep(NA, 68)

for(i in 1:length(subset$govreq)){
  subset$govreqadj[i] <- subset$govreq[i] * (1 / yearly_cpi$adj_factor[which(yearly_cpi$cpi_year == subset$year[i])])
  subset$enactedadj[i] <- subset$enacted[i] * (1 / yearly_cpi$adj_factor[which(yearly_cpi$cpi_year == subset$year[i])])
}


plot(subset$year[1:17],subset$govreqadj[1:17], ylim=c(95917334.1,134917334.1), type="o", main="KS", col=12)
points(subset$year[1:17],subset$enactedadj[1:17], type="o", col=11)

plot(subset$year[20:34],subset$govreqadj[20:34], ylim=c(561386.1,754648.9), type="o", main="NJ", col=12)
points(subset$year[20:34],subset$enactedadj[20:34], type="o", col=11)

plot(subset$year[35:47],subset$govreqadj[35:47], ylim=c(1997272609.0,2643358905.2), type="o", main="NY", col=12)
points(subset$year[35:47],subset$enactedadj[35:47], type="o", col=11)

plot(subset$year[49:60],subset$govreqadj[49:60], ylim=c(71835154.8,97858462.4), type="o", main="OK", col=12)
points(subset$year[49:60],subset$enactedadj[49:60], type="o", col=11)


utah <- budgets[which(budgets$state == "UT" & budgets$agency == "Courts"),]
utah$govreq <- gsub('\\$', '', utah$govreq)
utah$govreq <- gsub(',', '', utah$govreq)
utah$enacted <- gsub('\\$', '', utah$enacted)
utah$enacted <- gsub(',', '', utah$enacted)
utah$enacted <- as.numeric(utah$enacted)
utah$govreq <- as.numeric(utah$govreq)

utah$govreqadj <- utah$enactedadj <-  rep(NA, 14)

for(i in 1:14){
utah$govreqadj[i] <- utah$govreq[i] * (1 / yearly_cpi$adj_factor[which(yearly_cpi$cpi_year == utah$year[i])])
utah$enactedadj[i] <- utah$enacted[i] * (1 / yearly_cpi$adj_factor[which(yearly_cpi$cpi_year == utah$year[i])])
}
plot(utah$year,utah$govreqadj, ylim=c(108790.6,150581.1), type="o", main="UT", col=12)
points(utah$year,utah$enactedadj, type="o", col=11)






