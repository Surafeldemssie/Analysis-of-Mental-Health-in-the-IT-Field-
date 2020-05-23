library(dplyr)
mh2016 <- read.csv("C:/Users/hamed/desktop/Mental health 10-15/2016.csv")
q3_16 = select(mh2016,country = "What.country.do.you.work.in.", insurance = "Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.",treatment = "Have.you.ever.sought.treatment.for.a.mental.health.issue.from.a.mental.health.professional." )

# filltered by US,CAnada,UK 
q3f_16USA <- filter(q3_16, country=="United States of America")  
q3f_16UK <- filter(q3_16, country=="United Kingdom")  
q3f_16canada <- filter(q3_16, country=="Canada") 
q3f_16Germany <- filter(q3_16, country=="Germany") 
q3f_16<-rbind(q3f_16USA,q3f_16UK,q3f_16canada,q3f_16Germany)


#2017 dataset
mh2017 <- read.csv("C:/Users/hamed/desktop/Mental health 10-15/2017.csv")
q3_17 = select(mh2017,country = "What.country.do.you..strong.live..strong..in.", insurance = "Does.your.employer.provide.mental.health.benefitsÂ.as.part.of.healthcare.coverage.",treatment = "Have.you.ever.sought.treatment.for.a.mental.health.disorder.from.a.mental.health.professional." )

# filltered by US,CAnada,UK 
q3f_17USA <- filter(q3_17, country=="United States of America")  
q3f_17UK <- filter(q3_17, country=="United Kingdom")  
q3f_17canada <- filter(q3_17, country=="Canada") 
q3f_17Germany <- filter(q3_17, country=="Germany") 
q3f_17<-rbind(q3f_17USA,q3f_17UK,q3f_17canada,q3f_17Germany)

# reads the 2018 dataset
mh2018 <- read.csv("C:/Users/hamed/desktop/Mental health 10-15/2018.csv")
q3_18 = select(mh2017,country = "What.country.do.you..strong.live..strong..in.", insurance = "Does.your.employer.provide.mental.health.benefitsÂ.as.part.of.healthcare.coverage.",treatment = "Have.you.ever.sought.treatment.for.a.mental.health.disorder.from.a.mental.health.professional." )
# filltered by US,CAnada,UK
q3f_18USA <- filter(q3_18, country=="United States of America")  
q3f_18UK <- filter(q3_18, country=="United Kingdom")  
q3f_18canada <- filter(q3_18, country=="Canada") 
q3f_18Germany <- filter(q3_18, country=="Germany") 
q3f_18<-rbind(q3f_17USA,q3f_18UK,q3f_18canada,q3f_18Germany)
#combine 2016 to 2018 dataset
com_q3 <- rbind(q3f_16,q3f_18,q3f_17)
com_q3$treatment[com_q3$treatment == "1"] <- "Yes"
com_q3$treatment[com_q3$treatment == "0"] <- "No"
write.csv(com_q3,"C:/Users/hamed/desktop/Mental health 10-15\\com_q3.csv", row.names = FALSE)