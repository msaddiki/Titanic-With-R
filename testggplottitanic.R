
setwd("C:/R Training/ggplot/ggplot_titanic")
library(dplyr)
library(ggplot2)

# Load Titanic data for analysis. Open in spreadsheet view.
titanic<- read.csv("titanicdata.csv", stringsAsFactors = FALSE)
rm(customers_data)
rm(titanic)
rm(titanicdata)
rm(df)

df = data.frame(titanic)
df
View(df)
dplyr:: 
  df%>% distinct(select(survived, pclass, sex,embarked))


# changer les numeric en Factor 
df$pclass <- as.factor(df$pclass)
df$survived <- as.factor(df$survived)
df$sex <- as.factor(df$sex)
df$embarked <- as.factor(df$embarked)

str(df)


titanic
View(titanic)
# the survival rate? 

ggplot(df, aes(x = survived)) + geom_bar()

# One variable ( third code )
ggplot(df, aes(x= survived)) + geom_bar( fill = "green")+ ggtitle("les survivants titanic") + ylab("nombre des survivants") + xlab("statut")

# pourcentage des survivants
prop.table(table(df$survived))

   

# Survivants par sexe
ggplot(df, aes(x = sex, fill = survived)) + theme_bw() + geom_bar() + labs(y = "nombre de Passager", title = " repartition des survivants par sex")


# Survivants par type de classe

ggplot(df, aes(x = pclass, fill = survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "nombre de passager", title = "Survivants par type de classe")

# Survivants par type de classe et par sex

ggplot(df, aes(x = sex, fill = survived)) + 
  theme_bw() +
  facet_wrap(~ pclass) +
  geom_bar() +
  labs(y = "Passenger Count",title = "Survivants par type de classe et par sex")


# Survivants par sexe
ggplot(df, aes(x = age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "age (binwidth = 5)",
       title = "Titanic Age Distribtion")


#  survival rates by age?

ggplot(df, aes(x = age, fill = survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)", title = "Titanic Survival Rates by Age")

# Another great visualization boxplot

ggplot(df, aes(x = survived, y = age)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Age",
       x = "survived",title = "Titanic Survival Rates by Age")



# Sixth Question - What are the survival rates by age?
#
ggplot(df, aes(x = age, fill = survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",title = "Titanic Survival Rates by Age")

# Another great visualization for this question is the box-and-whisker 
# plot.
ggplot(titanic, aes(x = survived, y = age)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Age",x = "Survived", title = "Titanic Survival Rates by Age")

