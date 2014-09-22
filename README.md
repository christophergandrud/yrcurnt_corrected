yrcurnt_corrected
=================

Corrects errors and inconsistencies in the Database of Political Institution's
years to election (**yrcurnt**) variable. The new variable is called **yrcurnt_corrected**.
The original variable has a number of issues. Primarily:

- For a number of countries (e.g. Austria) the elections recorded are for a largely
figurehead president.

- Some countries are semi-presidential, but the PM is the clear leader of the government
and the domestic policy agenda. These powers are most relevant for studying things
like public budgeting.

- There are many instances where election years are not recorded as 0, as the
coding scheme defines.  

Currently only updated for EU27 Member States.

## Changes made

The full list of changes are given in the following table.

| Country | Changes                                                            |
| ------- | ------------------------------------------------------------------ |
| Austria | Use parliamentary rather than (figurehead) presidential elections. |
| Belgium | Corrects 2010 as an election year.                                 |
| Denmark | Corrects all post 1998 elections, which were not recorded as 0.    |
| Estonia | Corrects 1995, 1999, 2003, 2007, and 2011 elections. Also counting starts at 4, but should start at 3 as there is a 4 year term limit. |
| Germany | 2005 election not originally coded as 0.                           |
| Greece  | Corrects 2007, 2009, 2012 as election years.                       |
| Ireland | Corrects 2011 as an election year.                                 |
| Italy   | Corrects missing 2008 election.                                    |
| Lithuania | Use parliamentary rather than presidential elections. It is a semi-presidential system where the president appoints the PM, the legislature's approval is needed. PM is more responsible for domestic policy. |
| Latvia  | Corrects missing 2006, 2010, 2011 election years.                  |
| Netherlands | Corrects missing 2003 and 2006 elections.                      |
| Portugal | Corrects missing 1979, 1999, and 2011 elections.                  |
| Romania | Semi-presidential where the president appoints the PM, but they must be approved by the parliament and the PM is both head of government and sets the legislative agenda. Before 2008 presidential and parliamentary elections had happened in the same year. |
| Slovenia | Use parliamentary rather than (figurehead) presidential elections.|
| Slovakia | Corrects missing 2012 election.                                   |
| Spain   | Corrects missing 1989, 1996, and 2011 elections.                   |
| United Kingdom | Corrected missing 2001 and 2005 elections.                  |
