Corrected Election Timing Variable (yrcurnt)
=================

Christopher Gandrud

Corrects errors and inconsistencies in the
[Database of Political Institution's](http://go.worldbank.org/2EAGGLRZ40) (2013)
years to election (**yrcurnt**) variable. 

The corrected variable is called **yrcurnt_corrected**. It is currently updated
for EU 28 countries and most other OECD countries.

**Update**: The most recent version data available in this repository now updates the 2015 version 
of the DPI up to 2013. More work is needed to fully correct the 2015 version.

## Motivation

The **yrcurnt** election timing variable is a regularly used measure of government
election timing. For example, [Alt et al. (2014)](http://dx.doi.org/10.1017/S0007123414000064)
use the variable in their recent study of fiscal gimmickry in Europe. They find
that fiscal gimmickry is more common directly before elections (and in countries
with weak fiscal transparency).

Because the variable is so regularly turned to for testing how election timing affects
governments' choices, it is especially important that it be reliable and valid.
However, the variable in the current (2013) release has a number of issues that
this post highlights and corrects.

Note that Alt et al.'s substantive findings hold up when using the correct data,
though the estimated magnitudes of the effects are reduced somewhat. See
the [replication repository](https://github.com/christophergandrud/Alt_et_al_2014_Replication)
for more details.

### Variable definition

The
[codebook](http://siteresources.worldbank.org/INTRES/Resources/469232-1107449512766/DPI2012_Codebook2.pdf)
classifies the **yrcurnt** variable as the years left in the chief
executive's current term such that:

> ''a '0' is scored in an election year, and n-1 in the year after an election, where n is the length of the term. In countries where early elections can be called, YRCURNT is set to the de jure term limit or schedule of elections, but resets in the case of early elections.''

### Issues in the data

The original variable has a number of issues that make it problematic for studying
the effect of election timing on government policymaking. Primarily:

#### Validity concerns

- For a number of countries (e.g. Austria) the elections recorded are for a largely
figurehead president. This can affect both when election is recorded and how many
years until the next election as figurehead presidents often have longer terms than
parliaments. In these cases the current **yrcurnt** variable is not
a valid measure of *government* election timing.

- Some countries are less clear cut in that they are semi-presidential. Nonetheless,
in a number of these cases (e.g. Romania), the PM is the clear leader of the government
and the domestic policy agenda. These powers are most relevant for studying things
like public budgeting.

#### Reliability concerns

- There are many instances where election years are not recorded as 0, as the
coding scheme defines. See the table below for details.

## Updated Data

A corrected version of the variable for EU 28 countries and most other OECD
countries can be found in
[data/yrcurnt_corrected.csv](data/yrcurnt_corrected.csv).
*This includes only corrected observations*. A data file with both full
the original and corrected data can be found in [data/yrcurnt_original_corrected.csv](data/yrcurnt_original_corrected.csv).

Election timing data from 1990 to the present was found at the
[European Election Database](http://www.nsd.uib.no/european_election_database/),
when data was available.
These election dates were corroborated with data from Wikipedia. Election dates
from before 1990 and for non-European countries are also from Wikipedia.

The full list of changes are given in the following table.

### Change List

| Country | Changes                                                            |
| ------- | ------------------------------------------------------------------ |
| Australia | Corrects missing 1998 election year.                             |
| Austria | Use parliamentary rather than (figurehead) presidential elections. |
| Belgium | Corrects missing 1977 and 2010 election years.                     |
| Bulgaria | Now uses parliamentary, rather than presidential elections as the president is largely ceremonial. |  
| Canada  | Corrects missing 1980, 1984, 1988, 2000, 2006, 2008, 2011 election years. |
| Denmark | Originally counted 1981 election as occurring in 1982. Corrects missing 2001 and 2007 elections. |
| Estonia | Corrects 1995, 1999, 2003, 2007, and 2011 elections. Also counting originally started at 4, but should start at 3 as there is a 4 year term limit (not 5). |
| Germany | Corrects missing 2005 election.                                    |
| Greece  | Corrects missing 1990, 2007, 2009, 2012 election years.            |
| Iceland | Corrects missing 2009 election year.                               |
| Ireland | Corrects missing 2011 election.                                    |
| Israel  | Corrects missing 2006, 2009, 2013. 1984 election incorrectly coded in 1985. |
| Italy   | Corrects missing 2008 election.                                    |
| Japan   | Corrects missing 2005 and 2012 elections. Corrects misclassification of the 2003 and 2009 elections, which were originally erroneously labeled as being in 2004 and 2008, respectively. |
| Lithuania | Use parliamentary rather than presidential elections. It is a semi-presidential system where the president appoints the PM, the legislature's approval is needed. PM is more responsible for domestic policy. |
| Latvia  | Corrects missing 2006, 2010, 2011 election years.                  |
| Netherlands | Corrects missing 2003 and 2006 elections.                      |
| Portugal | Corrects missing 1979, 1999, and 2011 elections.                  |
| Romania | Semi-presidential where the president appoints the PM, but they must be approved by the parliament and the PM is both head of government and sets the legislative agenda. Before 2008 presidential and parliamentary elections had happened in the same year. |
| Slovenia | Use parliamentary rather than (figurehead) presidential elections.|
| Slovakia | Corrects missing 2012 election.                                   |
| Spain   | Corrects missing 1989, 1996, and 2011 elections.                   |
| United Kingdom | Corrected missing 1987, 2001, and 2005 elections.           |
