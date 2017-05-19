# The original code is from @Henryjean <https://github.com/Henryjean/Rogers-Cardigans/blob/master/MrRogers.R>

# Some slight modifcations by @jhollist to create the cardigan_colors 
# data frame
# Load packages
library(rvest)
library(dplyr)

#Point to the blog post that hosted the data
url <- "https://web.archive.org/web/20110525014454/http://neighborhoodarchive.blogspot.com/2011/05/sweater-colors.html"

#Snag the color codes for each episode
colorcodes <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="post-body-8947413617201264605"]/table/tbody/tr/td') %>%
  html_attr("bgcolor")

colorcodes <- as.data.frame(colorcodes)

#Snag the episode numbers for each episode
episodenumbers <-  url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="post-body-8947413617201264605"]/table/tbody/tr/td') %>%
  html_text()

episodenumbers <- as.data.frame(episodenumbers)

#Create a dataframe that combines the hex color codes with the episode numbers
df <- cbind(episodenumbers, colorcodes)

#Create a  variable for the year the episode aired. Source: http://www.neighborhoodarchive.com/mrn/episodes/index.html#year 
df$year <- NA
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1461 & as.numeric(as.character(df$episodenumbers))  <=  1465, 1979, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1466 & as.numeric(as.character(df$episodenumbers))  <=  1475, 1980, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1476 & as.numeric(as.character(df$episodenumbers))  <=  1490, 1981, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1491 & as.numeric(as.character(df$episodenumbers))  <=  1510, 1982, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1511 & as.numeric(as.character(df$episodenumbers))  <=  1525, 1983, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1526 & as.numeric(as.character(df$episodenumbers))  <=  1540, 1984, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1541 & as.numeric(as.character(df$episodenumbers))  <=  1555, 1985, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1556 & as.numeric(as.character(df$episodenumbers))  <=  1570, 1986, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1571 & as.numeric(as.character(df$episodenumbers))  <=  1585, 1987, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1586 & as.numeric(as.character(df$episodenumbers))  <=  1600, 1988, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1601 & as.numeric(as.character(df$episodenumbers))  <=  1615, 1989, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1616 & as.numeric(as.character(df$episodenumbers))  <=  1630, 1990, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1631 & as.numeric(as.character(df$episodenumbers))  <=  1645, 1991, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1646 & as.numeric(as.character(df$episodenumbers))  <=  1660, 1992, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1661 & as.numeric(as.character(df$episodenumbers))  <=  1670, 1993, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1671 & as.numeric(as.character(df$episodenumbers))  <=  1680, 1994, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1681 & as.numeric(as.character(df$episodenumbers))  <=  1695, 1995, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1696 & as.numeric(as.character(df$episodenumbers))  <=  1710, 1996, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1711 & as.numeric(as.character(df$episodenumbers))  <=  1720, 1997, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1721 & as.numeric(as.character(df$episodenumbers))  <=  1735, 1998, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1736 & as.numeric(as.character(df$episodenumbers))  <=  1750, 1999, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1751 & as.numeric(as.character(df$episodenumbers))  <=  1760, 2000, df$year)
df$year <- ifelse(as.numeric(as.character(df$episodenumbers)) >= 1761 & as.numeric(as.character(df$episodenumbers))  <=  1765, 2001, df$year)

# Kill factors
df$episodenumbers <- as.numeric(as.character(df$episodenumbers))
df$colorcodes <- as.character(df$colorcodes)
cardigan_colors <- df %>%
  filter(!is.na(df$year))

#Count the number of times each color sweater appeared
cardigan_colors_frq <- df %>% 
  group_by(colorcodes) %>% 
  mutate(count = n())%>%
  data.frame
