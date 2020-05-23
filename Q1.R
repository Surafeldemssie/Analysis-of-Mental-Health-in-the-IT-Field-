library(dplyr)
mh2014 <- read.csv("~/INST 408G/Project/Data/2014-Mental-Health.csv")

#Countries( filter for US)
#Year (2014 the column is called "country" in 2018 column is called "what country you live in".
# Gender
#Would you be willing to discuss a mental health issue with your supervisor?
# newDF <- rbind (df1, df2) to combine dataframe 


# df wit year, countery, gender
q1_14 = select(mh2014,"Year","Country","Gender", talk = "Would.you.be.willing.to.discuss.a.mental.health.issue.with.your.direct.supervisor.s.." )

# filltered by US 
q1f_14 <- filter(q1_14,Country == "United States")

# reads the 2018 dataset
mh2018 <- read.csv("~/INST 408G/Project/Data/2018-Mental-Health.csv")

#Countries( filter for US)
#Year (2014 the column is called "country" in 2018 column is called "what country you live in".
# Gender
#Would you be willing to discuss a mental health issue with your supervisor?
#Use append 
# newDF <- rblind (df1, df2) to combine dataframe 


# df wit year, countery, gender
q1_18 = select(mh2018,"Year", Country = "What.country.do.you..strong.live..strong..in.", Gender = "What.is.your.gender."
               ,talk = "Would.you.feel.comfortable.discussing.a.mental.health.issue.with.your.direct.supervisor.s..")

# filltered by US for 2018
q1f_18 <- filter(q1_18,Country == "United States of America")
#combine 2014 & 2018 dataset
com_q1 <- rbind(q1f_14,q1f_18)

summarise_each(com_q1)
temp <- summary.data.frame(com_q1)



# to export the dataframe to 
write.csv(com_q1,"~/INST 408G/Project/Data\\Q1.csv", row.names = FALSE )





  