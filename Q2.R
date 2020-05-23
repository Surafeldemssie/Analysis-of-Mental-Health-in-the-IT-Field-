
#Question  2 
# Compare how many people seek treatment for mental health by age (2014-2016-2017-2018)
# 
# Comments:
#   
# Columns needed for this analysis
# Age?
# Do you have health insurance ( make sure this column exists in every year)
# The years 2016 - 2018
# Did you seek mental treatment?

library(dplyr)

#opens the files and puts them into a dataset
mh2014 <- read.csv("~/INST 408G/Project/Data/2014-Mental-Health.csv")
mh2016 <- read.csv("~/INST 408G/Project/Data/2016-Mental-Health.csv")
mh2017 <- read.csv("~/INST 408G/Project/Data/2017-Mental-Health.csv")
mh2018 <- read.csv("~/INST 408G/Project/Data/2018-Mental-Health.csv")

q2_2014 <- select(mh2014, "Year","Age", Treatment = "Have.you.sought.treatment.for.a.mental.health.condition.",
                  "Mental Health Benefits"="Does.your.employer.provide.mental.health.benefits." )

q2_2016 <- select(mh2016, 'Year', Age = "What.is.your.age.", Treatment ="Have.you.ever.sought.treatment.for.a.mental.health.issue.from.a.mental.health.professional.",
                  "Mental Health Benefits"="Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.")
# to replace 1's & 0's with Yes and No 
q2_2016$Treatment <- as.character(q2_2016$Treatment)
q2_2016$Treatment[q2_2016$Treatment == "1"] <-"Yes"

q2_2016$Treatment <- as.character(q2_2016$Treatment)
q2_2016$Treatment[q2_2016$Treatment == "0"] <-"No"


q2_2017 <- select(mh2017,Year, Age = "What.is.your.age.", Treatment = "Have.you.ever.sought.treatment.for.a.mental.health.disorder.from.a.mental.health.professional.",
                  "Mental Health Benefits" = "Does.your.employer.provide.mental.health.benefitsÂ.as.part.of.healthcare.coverage." )
# to replace 1's & 0's with Yes and No 
q2_2017$Treatment <- as.character(q2_2017$Treatment)
q2_2017$Treatment[q2_2017$Treatment == "1"] <-"Yes"

q2_2017$Treatment <- as.character(q2_2017$Treatment)
q2_2017$Treatment[q2_2017$Treatment == "0"] <-"No"


q2_2018 <- select(mh2018, "Year", Age = "What.is.your.age.", 
      Treatment = "Have.you.ever.sought.treatment.for.a.mental.health.disorder.from.a.mental.health.professional.",
      "Mental Health Benefits" = "Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.")

# to replace 1's & 0's with Yes and No 
q2_2018$Treatment <- as.character(q2_2018$Treatment)
q2_2018$Treatment[q2_2018$Treatment == "1"] <-"Yes"

q2_2018$Treatment <- as.character(q2_2018$Treatment)
q2_2018$Treatment[q2_2018$Treatment == "0"] <-"No"

#combine the data
com_q2 <- rbind(q2_2014,q2_2016,q2_2017,q2_2018)

# to export the dataframe to 
write.csv(com_q2,"~/INST 408G/Project/Data\\Q2.csv", row.names = FALSE )

q2_clean <- read.csv("~/INST 408G/Project/Data/Q2.csv")
q2_clean <- filter(q2_clean,!is.na(Age))


q2_clean$AgeCat <- q2_clean$Age

for (i in 1:nrow(q2_clean)){
  if(q2_clean$Age[i]>54){
    q2_clean$AgeCat[i] <- "55+"
  }
}
write.csv(q2_clean,"~/INST 408G/Project/Data\\Q2_cat.csv", row.names = FALSE )

