# Final Report 

### Code name: 
American Homelessness

#### Authors: 
Brennon Lee (blee21@uw.edu), Rayna Ojas (rayy727@uw.edu), and Trevor Wong (tjwong22@uw.edu)

#### Affiliation: 
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington 

#### Date: 
Autumn 2022

## Abstract
Our main question is how does homelessness vary between states in America and why? This question is important because by analyzing the homelessness data between states, we can try to analyze a pattern between states with more homelessness vs less homelessness. If we are able to find some patterns, we can offer solutions or recommendations on how to hopefully reduce homelessness. 

## Keywords

    - Homelessness
    - United States
    - Poverty
    - Shelter
    - Housing

## Introduction

Shelter and housing is something that may seem basic. You probably are fortunate enough to have a roof over your head and a bed to go to at the end of the day. However, across America, there are over half a million people who aren't as fortunate and aren't able to have a roof over their head or a bed to sleep in. This causes many problems and challenges not only for those that are homeless, but also those around them.
While you may think that someone being homeless is their own fault or their own choice, more often than not this isn't the case. There are many external reasons why someone may be facing homelessness including the lack of structural supports for those experiencing poverty, job loss that is out of their control, and inadequate help and discharge from people that are leaving hospitals, correctional, or mental health facilities.

## Problem Domain
* **Project Framing:** Working with homelessness data of America, we hope to bring attention to the issue that hundreds of thousands of Americans suffer from. We plan to use the data to highlight how homelessness affects each state and the response from each state to mitigate the issue. If time permits, including resources to assist homelessness may be a route to take so that the project extends the scope of research and becomes a resource to help homelessness. Seattle is already in the process of assisting the homeless in Seattle ([Addressing Homelessness](https://www.seattle.gov/human-services/reports-and-data/addressing-homelessness#:~:text=Who%20is%20experiencing%20homelessness%20in,compared%20to%20the%202019%20Count.)), but the project may be useful to areas across the nation where the city is not making any efforts.

* **Human Values:** Our motives for pursuing this topic centers around the values of community, justice, and power in a sense. As homelessness is an issue that results from a variety of factors for the given person, we wish to pinpoint how some of those factors contribute such as location and policies, a heavy emphasis is placed on policy per state in this Breakpoint article ([Homelessness in America: Why Many Solutions Fail](https://breakpoint.org/homelessness-in-america-why-many-solutions-fail/)). Our project is created with the motivation of a better community, all while maintaining a just perspective of the matter, and empowering those who lack the power and resources to sustain themselves.

* **Direct and Indirect Stakeholders:** Direct stakeholders of this project would include the homeless themselves as the data directly involves them and their information. Another direct stakeholder would be individuals accessing the data to benefit from the information within it. Indirect stakeholders would be the individuals accessing the data to browse the contents -- they have access, but the data does not benefit or harm them at all.

* **Harms:** Possible harms that may be produced from the project are unpredictable yet some can be assumed. Directing people's attention to the homelessness issue may lead to outcomes such as a decrease of homelessness in an area, but in exchange for the increase in another area. There's also the issue of properly reducing homelessness numbers leading to the overcrowding of long established residential areas and distrust in those communities. Our goal is not to encourage these harms, so we will be keeping them in mind while developing the project and making decisions.
* **Benefits:** The potential benefits of this project exceeds just directing peoples attentions to the situation, but it also includes directing peoples attentions to solutions that may lessen the homelessness volumes in the nation. If by chance the project successfully improves homelessness, then the communities of cities where homelessness persisted are able to improve and flourish. As Seattle residents claimed when hearing about Seattles homeless encampment cleanup, “I’m looking forward to it. It's like, quiet,” ([Seattle Homeless Encampment Near I-5 Cleared Through Gov. Inslee's Initiative](https://komonews.com/news/local/seattle-homeless-encampment-cleared-through-governor-inslees-initiative)).


## Research Questions
1. How does homelessness vary between states in America and why?

Homelessness is something that occurs across the nation but understanding how it is distributed may provide value in understanding trends across the nation. Is geography a factor? Does the population of a city play a role? Discovering the distribution (likely in the form of a figure) will provide insight to answering these questions and more.

2. What factors may contribute to the volume of homelessness in a city?

In addition to the first question, this question dives deeper and focuses on the factors present within each state or city. Perhaps the cost of living in one city is more than another, or maybe drug abuse is a bigger issue in one area than another, or even just the amount of jobs available to the area isn’t good enough. There are many factors that affect homelessness, but our project strives to find the factors that have the most effect on the matter.

3. In Seattle, how has the homelessness issue changed over the years? Have services offered over the years led to a change in the numbers?

We see homelessness on the streets of Seattle since we live/learn in the area, but how has this changed over time? Using a dataset describing the status of homelessness through 1998-2020, we want to analyze it to understand the trends over different spans of time that affected homelessness. Through understanding, we can find what efforts may be more effective and which methods may be ineffective.


## The Dataset
|Data file name | Purpose|Number of Observations|Number of Variables|Citation|
|-----| -----------------| ----------|------------|-----------|
|[homelessness_2020.csv](https://github.com/info201a-au2022/project-group-3-section-ag/blob/main/data/homelessness_2020.csv) | A data set that has homelessness counts for 2020 in each state to give us data on the number of homeless. | 58 | 541 | Pit and HIC Data since 2007.” HUD Exchange, https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/
|[homelessness_change.csv](https://github.com/info201a-au2022/project-group-3-section-ag/blob/main/data/homelessness_change.csv) | A data set that has the percent change in homelessness since 2020 so we can calculate the homeless counts for previous years. | 58 | 14 | “Pit and HIC Data since 2007.” HUD Exchange, https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/.
|[DHS_Daily_Report.csv](https://github.com/info201a-au2022/project-group-3-section-ag/blob/main/data/DHS_Daily_Report.csv) | A data set that has details about number of people in homeless shelters to find out the ratio of those that are homeless but still getting help with shelters. | 3306 | 13 | https://catalog.data.gov/dataset/dhs-daily-report

These data sets are important for our research questions as they will be able to tell us the distribution of homelessness in the states. For example, the first data set has the homelessness counts for each state which will explicitly tell us the differing homelessness counts in each state. The second and third questions will be answered not explicitly through the datasets, but by looking at the data and doing extra external research, we can come to conclusions that can help us answer the questions.

**Provenance:**

Our first and second dataset was collected by the Housing for Urban Development (HUD) exchange. The HUD exchange is a government organization that collects data for the purpose of helping its community members. The data was collected between 2007 and 2020 each year. The data collection was funded through the government which was funded by tax payers money. No one will gain much from the data as the government is providing it. The data is validated by many people since it is the government publishing the information and it has to be credible to be released to the public. We obtained the data through various searches and we cited it in our work.

The third dataset was collected by the Department of Homeland Security (DHS). Similarly to the first two dataframes, this data was also collected by a government organization in order to benefits its community members by providing this data about the number of people that are in shelters. This data was collected in 2022 and was funded through the government which was funded by tax payers. Since the government is providing the information, no one really gains moeny from this data. The data is validated by many people since it is the government publishing the information and it has to be credible to be released to the public. We obtained the data through various searches and we cited it in our work.

## Findings

1. How does homelessness vary between states in America and why?

Homelessness varies vastly between states in America. The state with the greatest homelessness was California. This might have been due to the vast amounts of people in the state which means there overall will be more homeless people. California has the highest population out of any state so there are more chances for a person to be homeless which is why they have the highest homeless count. In contrast, the state with the lowest counts was North Dakota. North Dakota has the fifth lowest population count. As an opposite to California, the lower population means that there are less chances for someone to be homeless meaning the count will be lower. The second lowest count is Wyoming which has the lowest population count in the entire United States.

However, after diving deeper, it isn’t as simple as that. California is still in the top three when it comes to homeless ratio in regard to the homeless to total population, but they aren’t the first. The top three with this ratio is New York, Hawaii, and then California. The bottom three is Mississippi, Louisiana, and then Alabama. North Dakota has the fifth lowest rate and Wyoming has the 22nd lowest rate. As we found out, the ratios are different from what we expected given just the homeless counts. What we found out regarding higher homeless ratios is that both New York and California have well developed cities in New York and Los Angeles. When you look at the homeless rates in those cities, they are the highest out of all cities in the United States which is a huge contributing factor to why those states have high homeless rates. The bigger the city, the more people it draws in to live in the cities, but the high living rates of these progressed cities also makes it that much harder to actually live in the city which leads to homelessness. In regard to Hawaii, it is an island and so people that are born there can’t get off the island to live somewhere else. The homeless stay trapped which leads to more and more homeless. In contrast, the states with lower homeless rates don’t have many major cities which leads to the average living cost to be a lot lower. More people can afford to live in these areas and prevent themselves into becoming homeless. Something we noticed was that Mississippi actually has the highest poverty rate but because the cost of living is so low, it cancels out which leads to less homless.

2. What factors may contribute to the volume of homelessness in a city?

Some factors that may contribute to the volume of homelessness is the number of people in a location. As explained in the first question, the more people in a location, the higher chance there is for someone to be homeless. That is why many larger states have a higher homeless count and rate. Additionally, the average income and cost of living is a big factor. In both California and New York, the cost of living is really high and the average income is also brough up due to many millionaires. However, many people that aren’t able to make that average income aren’t able to afford a place to live which causes them to become homeless. 

3. In Seattle, how has the homelessness issue changed over the years? Have services offered over the years led to a change in the numbers?

Washington unfortunately has the fifth highest homeless count. Recently, the homeless count has been increasing. However, homeless in general has been increasing in the entirety of the United States. Washington has been trying to enact new policies to treat homelessness. While some of them have been successful, the counts have still been on the rise. Fighting homelessness is hard because a lot of fighting homeless is creating affordable places for these individuals to live. However, in the case of Seattle, a rising large city, there isn’t a lot of space to place shelters. With this in mind, Seattle has done a decent job in fighting homeless as the counts haven’t risen drastically. As Seattle continues to progress in its fight against homeless, we would love to see these homeless counts start to decrease.

## Discussion

This fight against homeless is very important. Not only is it important for those experiencing homelessness, but also those around them – everyone is impacted. Shelter is a basic necessity, and everyone should have access to it. There are various reasons why someone might be facing homelessness but we should strive to eliminate homelessness. Homelessness impacts many people as it creates more dirtiness around many large cities. These individuals end up living in the streets and leaving their belonging in these places which can lead to further problems for the city and its community members.

As mentioned in our findings, one of the leading causes for homelessness is the state has a major city in it which leads to a high cost of living and a high average income. This is important because as the world progresses, every place is eventually going to become more urban. As cities like New York and Los Angeles run out of places to expand, they will look to urbanize and expand to other surrounding cities. As those states run out of areas to expand, companies will look to other cheaper areas to expand into, creating more large cities in these smaller states. If this continues and the homelessness follows the same pattern that it has been following, then as more cities expand, the cost of living will rise as the city become more urban, developed, and luxurious. As this happens, the homeless counts will most likely also rise in these cities. This is an important and a concern that we as a team had. While developing more cities is important for many states and our country as a whole, it also is detrimental to many people that won’t be able to afford to live in these areas. If we continue to urbanize, these states will have to come up with more ideas to help support and fight homelessness. One idea that we had is before developing all these areas, making sure that there are sufficient shelters and low income housing for those that won’t be able to afford the high rates of living. Additionally, we suggest to emphasize education and see if there is any way to freely educate the homeless and to get the jobs in places that will allow them to afford more areas. In doing this, the homeless can get some more skills to better society but also improve their own lives. 

## Conclusion

Homelessness is a very big problem across the entire United States. Homelessness has been gradually on the rise and if we don’t do anything to stop this, it will keep rising and impact everyone in the nation. Throughout this investigation our team utilized various datasets created by the government in order to determine key facts about homelessness and to answer research questions regarding homelessness. We aimed to give the audience a wholistic view on homelessness in the hopes that the reader can grasp the severity of this problem and to hopefully make an effort to fight this problem. 

Homelessness is the biggest in states with large cities, a high cost of living, and a high average income. In these areas, the homeless can’t afford to live in these areas, however, they don’t have the funds to move into a different place which causes these areas to continuously grow their homeless population. Additionally, these developed areas don’t have the space to create more shelters and to support these homeless populations. As the nation progresses, we can see more places becoming urbanized which is a cause for concern in regard to a large increase in homelessness. As more cities become developed, the cost of living and average income will also rise which will create more areas that people won’t be able to afford. If this pattern continues and states don’t do enough to fight this homeless problem, we can see homelessness taking over. 
Homelessness doesn’t just impact those that are homeless. While these individuals are suffering and can’t have access to a basic necessity, this problem also impacts **YOU**. As the homeless increases, they will be pushed out into more cities and possibly a city that you are living in. Since these individuals don’t have anywhere to live, they often leave around their belonging and trash in the streets that they reside in. This can create large messes in these areas which can impact your own living areas. If we don’t do anything, many areas will become messy and riddled with homeless. We have to do something to give our support to these individuals so that they can gain shelters and so that cities can remain clean and healthy. 

## Acknowledgements
We would like to thank our TA Rona Guo who has helped has throughout this project to ensure a successful project.

## References
```
“Addressing Homelessness.” Addressing Homelessness - Human Services, https://www.seattle.gov/human-services/reports-and-data/addressing-homelessness#:~:text=Who%20is%20experiencing%20homelessness%20in,compared%20to%20the%202019%20Count.

Adekom. “Metropolitan-Homelessness/2018 MSA Homeless Population.csv at Master · Adekom/Metropolitan-Homelessness.” GitHub, 7 Dec. 2019, https://github.com/adekom/metropolitan-homelessness/blob/master/2018%20MSA%20Homeless%20Population.csv.

“DHS Daily Report.” Catalog, Publisher Data.cityofnewyork.us, 11 Nov. 2022, https://catalog.data.gov/dataset/dhs-daily-report.

“Pit and HIC Data since 2007.” HUD Exchange, https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/.

Rivera, Paul. “Seattle Homeless Encampment near I-5 Cleared through Gov. Inslee's Initiative.” KOMO, KOMO, 31 Oct. 2022, https://komonews.com/news/local/seattle-homeless-encampment-cleared-through-governor-inslees-initiative.

“State of Homelessness: 2022 Edition.” National Alliance to End Homelessness, 27 Sept. 2022, https://endhomelessness.org/homelessness-in-america/homelessness-statistics/state-of-homelessness/.

Stonestreet, John, and Kasey Leander. “Homelessness in America: Why Many Solutions Fail.” Breakpoint, 11 Oct. 2022, https://breakpoint.org/homelessness-in-america-why-many-solutions-fail/.

“What Causes Homelessness?” National Alliance to End Homelessness, 3 June 2020, https://endhomelessness.org/homelessness-in-america/what-causes-homelessness/.
```



