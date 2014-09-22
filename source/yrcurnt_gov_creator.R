#################
# Correct DPI yrcurnt years to elections variable to reflect government, not
# executive elections (Europe Only)
# Christopher Gandrud
# 22 September 2014
# MIT License
#################

# Load packages
library(psData)
library(DataCombine)

# Set working directory, change as needed.
setwd('/git_repositories/yrcurnt_corrected/')

# Years left in current term
YearsLeft <- DpiGet(vars = c('yrcurnt'), duplicates = 'drop', fromLast = TRUE)
YearsLeft$iso2c[YearsLeft$iso2c == 'GB'] <- 'UK'

# Keep only European 27
eu27 <- c("Austria", "Belgium", "Bulgaria", "Cyprus", "CzechRepublic", 
          "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", 
          "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", 
          "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia",
          "Slovenia", "Spain", "Sweden", "UnitedKingdom")

YearsLeft <- YearsLeft[YearsLeft$country %in% eu27, ]
YearsLeft <- YearsLeft[order(YearsLeft$country, YearsLeft$year), ]

# Recode -999 as NA
YearsLeft$yrcurnt[YearsLeft$yrcurnt == -999] <- NA

#### Create corrected time to election variable ####
# YearsLeft$yrcurnt_gov <- YearsLeft$yrcurnt

## Recode focusing on parliamentary elections, if executive is a figurehead
## Recode all election years as 0
## From the European Election Database (http://www.nsd.uib.no/european_election_database)
## and Wikipedia

#### Summary of changes
## Austrian parliamentary elections rather than figurehead president
## Belgium 2010 incorrectly not coded 0 for the parliamentary election year.
## Only one election year (2005) in Denmark post-1998 is coded with a 0. 
## Estonian elections in 1995, 1999, 2003, 2007, 2011 not correctly classified. 
# Also counting starts at 4, but should be 3 as there is a 3 year term limit.
## German election in 2005 not coded 0.
## None of the three (2007, 2009, 2012) Greek elections from 2004 are coded as 0.
## Ireland election in 2011 not recorded.
## Italy 2008 election not recorded.
## Lithuania use parliamentary rather than presidential elections. It is a 
# semi-presidential system where the president appoints the PM, the legislature's
# approval is needed. PM is more responsible for domestic policy.
## Latvian elections are not coded as 0 from 2002, though 2006, 2010, 2011 are 
# election years. Corrections made.
## Netherlands 2003 and 2006 elections not coded 0.
## Portugal elections in 1979, 1999, 2011 missing.
## Romania is semi-presidential. The president appoints the PM, but they must be 
# approved by the parliament and the PM is both head of government and sets the 
# legislative agenda. Before 2008 presidential and parliamentary elections had
# happened in the same year.
## Slovenia parliamentary elections rather than figurehead president.
# Also in the original measure (presidental) elections after 2002 were not coded 0.
## Sloviakia 2012 election not recorded.
## Spain 1989, 1996, and 2011 elections not recorded.

## Not corrected, but potentially problematic:
# Hungarian, Romanian elections during the communist period are coded, not NA.
# Poland is semi-presidential, but the president seems more powerful than the 
# Lithuanian president.

# Merge in changes
updated <- read.csv('data/yrcurnt_corrected.csv', stringsAsFactors = FALSE)
comb <- merge(YearsLeft, updated, by = c('country', 'year'), all = TRUE)

for (i in 1:nrow(comb)){
    if (is.na(comb[i, 'yrcurnt_corrected'])){
        comb[i, 'yrcurnt_corrected'] <- comb[i, 'yrcurnt']
    }
}

comb <- MoveFront(comb, c('worldbank_code', 'iso2c')
