library(dplyr)
mh2014 <- read.csv("~/INST 408G/Project/Data/2014-Mental-Health.csv")
mh2016 <- read.csv("~/INST 408G/Project/Data/2016-Mental-Health.csv")
mh2017 <- read.csv("~/INST 408G/Project/Data/2017-Mental-Health.csv")
mh2018 <- read.csv("~/INST 408G/Project/Data/2018-Mental-Health.csv")

#Does gender affect if they think that discussing a physical health issue with your employer would have negative consequences


# df wit year, countery, gender
q1_14 = select(mh2014,"Year","Country","Gender", "talk to supervisor" = "Would.you.be.willing.to.discuss.a.mental.health.issue.with.your.direct.supervisor.s..", 
               "talk to coworkers" = "Would.you.be.willing.to.discuss.a.mental.health.issue.with.your.coworkers.", 
               interview =  "Would.you.bring.up.a.mental.health.issue.with.a.potential.employer.in.an.interview.")

# filltered by US 
q1f_14 <- filter(q1_14,Country == "United States")

# reads the 2018 dataset


# df wit year, countery, gender
q1_18 = select(mh2018,"Year", Country = "What.country.do.you..strong.live..strong..in.", Gender = "What.is.your.gender."
               ,"talk to supervisor" = "Would.you.feel.comfortable.discussing.a.mental.health.issue.with.your.direct.supervisor.s.."
               ,"talk to coworkers" = "Would.you.feel.comfortable.discussing.a.mental.health.issue.with.your.coworkers.",
               interview =  "Would.you.bring.up.your.mental.health.with.a.potential.employer.in.an.interview.")

# filltered by US for 2018
q1f_18 <- filter(q1_18,Country == "United States of America")




q1_16 = select(mh2016,"Year", Country = "What.country.do.you.live.in.", Gender = "What.is.your.gender."
               ,"talk to supervisor" = "Would.you.have.been.willing.to.discuss.a.mental.health.issue.with.your.direct.supervisor.s.."
               ,"talk to coworkers" = "Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers."
               ,interview =  "Would.you.bring.up.a.mental.health.issue.with.a.potential.employer.in.an.interview.")


q1f_16 <- filter(q1_16,Country == "United States of America")



q1_17 = select(mh2017,"Year", Country = "What.country.do.you..strong.live..strong..in.", Gender = "What.is.your.gender."
               ,"talk to supervisor" = "Would.you.feel.comfortable.discussing.a.mental.health.issue.with.your.direct.supervisor.s.."
               ,"talk to coworkers" = "Would.you.feel.comfortable.discussing.a.mental.health.issue.with.your.coworkers.",
               interview =  "Would.you.bring.up.your.mental.health.with.a.potential.employer.in.an.interview.")

q1f_17 <- filter(q1_17,Country == "United States of America")

#combine 2014 & 2018 dataset
com_q1 <- rbind(q1f_14,q1f_16,q1f_17,q1f_18)

#summarise_each(com_q1)
#temp <- summary.data.frame(com_q1)



# to export the dataframe to 
write.csv(com_q1,"~/INST 408G/Project/Data\\Interview.csv", row.names = FALSE )





  