#### INTRO TO R, part II ####

#### 1. SETTING A WORKING DIRECTORY ####
# place the folder with all your materials from Google Drive to a single directory (e.g., in Documents)
# https://drive.google.com/drive/folders/1P2Yw1RCKDXC8CqDI4tyANWudCHKJU4hT?usp=sharing
# now set your working directory using 'setwd' function

getwd ()
setwd ("C:/Users/jezkovt/Dropbox/Workshop_materials/R") #this is my working directory

#let's see if you set it correctly using 'getwd'
getwd () #did you?

#### 2. READING A CSV FILE ##### 
# csv file is just like and excel file but you save it as *.csv instead of *.xls
# we will read a file using 'read.csv' function

frogs <- read.csv("nucdiv_het.csv", header = TRUE)

#the 'head' function shows us the first 5 or so rows of our file
head (frogs) 

#what does the 'header = TRUE' do? Let's find out
frogs <- read.csv("nucdiv_het.csv", header = FALSE)  
head (frogs)

#we will read another file using 'read.csv' function but this file is in the R_subfolder directory
# we have two options, either change our working directory or tell the read.csv function where our file is

setwd ("C:/Users/jezkovt/Dropbox/Workshop_materials/R/R_subfolder") #remember, this is my working directory
frogs <- read.csv("nucdiv_het_v2.csv", header = TRUE)  
#or
frogs <- read.csv("./R_subfolder/nucdiv_het_v2.csv", header = TRUE)  

# confirm with 'head'
head (frogs)

## EXCERCISE TIME ##

# importing a csv file from a different locations

#### 3. LOOKING FOR HELP ####

# let's modify our file using help from the interne, we will change column names, delete a column, and delete a row

getwd () #remind ourselves where we are, change if necesary
frogs <- read.csv("nucdiv_het.csv", header = TRUE) #import again, to be safe
head (frogs)

# so, how do we change a column name?
# how do we change all column names?
#how do we delete a column?
#How do we delete a row?


#### BREAK ####

#### 4. DOING REAL WORK ####

getwd ()  # we were messing around so let' remind ourselves where we are
setwd ("../") #shortcut to get one directory up

frogs <- read.csv("nucdiv_het.csv", header = TRUE)  
head (frogs)

# we will now explore whether heterozygosity and gene diversity is correlated

# first, we will make a plot
plot (heterozygosity ~ gene_diversity, data=frogs) # error? why?
#so, are they correlated?

## you already heard about packages. Let's use one to make our graph nicer
library (car) #load a package. did yours throw an error? Why do you think it did?
scatterplot (Heterozygosity ~ Gene_Diversity, data=frogs) #fancier version of the plot

# we can also test whether the correlation is statistically significant
# we will use a statistical test called Pearson Correlation

cor.test (frogs$Heterozygosity, frogs$Gene_Diversity, method="pearson")


#### 5. DOING REAL WORK - ON YOUR OWN ####

#now, you will look at correlation in a different dataset, 
#you will make a plot and run Pearson Correlation just like in the example above
#first I will provide you with a script but there will be mistakes. You have to correct them

hoppers <- read.csv ("grasshopper.csv", header = TRUE)  
head (hoppers)

plot (Range ~ Emergence, data=frogs)
cor.test (hoppers$Range, hoppers$Emergence, method="pearson")

plot (Range ~ Months_Present, data=hoppers)
corr.test (hoppers$Range, hoppers$Months_present, method="pearson")

plot (Range ~ Wing_Color, data=hoppers)
cor.test (hoppers&Range, hoppers&Wing_color, method="pearson")

plot (Range ~ Size, data=hoppers)
cor.test (hoppers$Range, hoppers$Size, method="pearson")

#what did you find out?


#### 6. NOW YOU WILL ANALYZE YOUR OWN, MADE-UP DATASET ####

# this one is mine

brain <- read.csv("scatterbrainedness.csv", header = TRUE)  
plot (scatter ~ pubs, data=brain) 
cor.test (brain$pubs, brain$scatter, method="pearson")

# this is what you need to do:
  # formulate a hypotheses about two variables being correlated
  # create an csv file in excel with two columns representing the two variables
  # reaad the csv file into  r
  # plot using the 'plot' or 'scatterplot' function
  # assess a statistical significance of the correlation using the 'cor test' function
  

# let's see what you guys have come up with


