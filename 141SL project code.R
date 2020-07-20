---
  title: "141 Final Report"
author: "Mengxuan Sun,Yuqing Yang, Xinyi Wang, Chengcheng Xu"
date: "March 2, 2020"
output:
  pdf_document:
  latex_engine: xelatex
number_sections: yes
toc: yes
toc_depth: 3
html_document:
  df_print: paged
toc: yes
toc_depth: '3'
header-includes:
  - \usepackage{geometry}
- \geometry{left=1in,top=0.875in,right=1in,bottom=0.875in, headheight=0.25in,headsep=0.125in,footskip=0.125in,portrait,twoside=true}
- \usepackage{fancyhdr}
- \pagestyle{fancy}
- \rhead{Winter 2020}
- \lhead{Stat 141SL}
- \rfoot{\thepage}
- \lfoot{}
- \renewcommand{\headrulewidth}{1pt}
- \renewcommand{\footrulewidth}{1pt}
---
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
\thispagestyle{empty}
\newpage
\section{Abstract}
\Large In our study, we explored which variables affect the level of stress among STEM students and NON-STEM students. The data is obtained from a survey answered by UCLA students. Through the use of graphic visuals, text mining, and two sample t test we found that there is a significant difference between the stress level of STEM students and the stress level of NON-STEM students. Also, we studied how students’ academic and daily/social life(relationship with roommates and dating life) experience affect their stress level, as well as the interaction of whether a student is international and whether or not the student is eager to find a job soon after graduation. Besides these, we also looked for some variables that we have found out that may also have some influence on our response value.

Based on what we have researched, we have concluded our findings. There are also some challenges during our work that we are concerned about, and we also think about what we can do better about this study in the future.


\section{Background}
\Large Stress among college students can be overwhelming and can affect many areas of a student’s life. Different majors lead to different levels of workload and cause different levels of stress. There are two main divisions of major selection nowadays: STEM and NON-STEM. STEM stands for science, technology, engineering, and math. In the survey, students report if they study STEM majors or not. Students also evaluate their own stress levels at the end of the questionnaire.  

\section{Clear Statement of The Problems To Be Solved}
\Large We are particularly interested in studying on the following statements in this report:\newline
1. Overall findings from comparing STEM with NON-STEM majors.\newline
2. What are some factors that may impact the level of stress for STEM and Non-STEM students?\newline
3. Over findings from Q2.1-Q2.5 and Q3.1-Q3.24.\newline
4. Overall findings from each of the 2 open-ended questions. (HelpFactor & InbibitFactor)\newline
5. Hypothesis Testing

\section{Variables of The Study}
\Large See attached code book

\section{Data Cleaning}


## Drop Rows and Columns
```{r,echo=FALSE}
suppressMessages(library(dplyr,warn.conflicts = FALSE))
suppressMessages(library(ggplot2,warn.conflicts = FALSE))
suppressMessages(library(tidyr,warn.conflicts = FALSE))

data <- read.csv('~/Desktop/newstem.csv')
data = data[,-c(51,52,53,55)]
data=data[complete.cases(data[,51]),]
dim(data)
```
- We use Excel to remove rows from 868 to 1128 because we found out this part of the data is from another survey.

- We decided to remove the columns "Academic", "SES", "Belonging", "Exclusion" because we focus on investigating the Stress as our outcome variable. We also dropped the rows containing missing values. The remaining dataset has 846 rows and 51 columns. 

## Data Types

- There are five numberic variables: GPA, HighGPA, SameEthic, OtherEthnic, and Stress.

- The rest of the variables are categorical.

\section{Exploratory Data Analysis }

## Overall findings from comparing STEM with NON-STEM majors.

```{r,echo=FALSE}
data1=read.csv('~/Desktop/stem.csv')

data1=data1[complete.cases(data1[,51:55]),]

stem=data1[which(data1$STEM=="Yes"),]
nonstem=data1[which(data1$STEM=="No"),]
stem=stem[which(stem$Gender!="Genderfluid"&stem$Gender!="Transgender female"),]

## I cleaned the levels of Ethnic for stem and nonsteam major because a lot of same ethnic but different writing lead to a lot of levels, after I cleaned the data, there are 7 ethnics: "NA","Asian","American","Caucasian","White","Latino/Hispanic",and "Middle Eastern", NA means these students didn't answer or only answered mixed but didn't specific ethnics.

levels(stem$Ethnic)[1]="NA";levels(stem$Ethnic)[2]="Caucasian";levels(stem$Ethnic)[3]="Asian";levels(stem$Ethnic)[4]="American";levels(stem$Ethnic)[5]="American";levels(stem$Ethnic)[5]="American";levels(stem$Ethnic)[5]="American";levels(stem$Ethnic)[5]="American";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="Asian";levels(stem$Ethnic)[5]="NA";levels(stem$Ethnic)[5]="NA";levels(stem$Ethnic)[5]="Latino/Hispanic";levels(stem$Ethnic)[6]="NA";levels(stem$Ethnic)[6]="Latino/Hispanic";levels(stem$Ethnic)[7]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[6]="Caucasian";levels(stem$Ethnic)[7]="Asian";levels(stem$Ethnic)[7]="Asian";levels(stem$Ethnic)[7]="Asian";levels(stem$Ethnic)[7]="Latino/Hispanic";levels(stem$Ethnic)[7]="Latino/Hispanic";levels(stem$Ethnic)[7]="NA";levels(stem$Ethnic)[7]="Asian";levels(stem$Ethnic)[7]="Asian";levels(stem$Ethnic)[7]="Middle Eastern";levels(stem$Ethnic)[8]="Middle Eastern";levels(stem$Ethnic)[8]="Latino/Hispanic";levels(stem$Ethnic)[8]="Middle Eastern";
levels(stem$Ethnic)[8]="Middle Eastern";levels(stem$Ethnic)[8]="Middle Eastern";levels(stem$Ethnic)[8]="NA";levels(stem$Ethnic)[8]="White";levels(stem$Ethnic)[9]="Caucasian";levels(stem$Ethnic)[9]="Caucasian";levels(stem$Ethnic)[9]="Caucasian";levels(stem$Ethnic)[9]="Caucasian";levels(stem$Ethnic)[9]="NA";levels(stem$Ethnic)[9]="NA";levels(stem$Ethnic)[9]="American";levels(stem$Ethnic)[9]="American";levels(stem$Ethnic)[9]="Caucasian";levels(stem$Ethnic)[9]="Middle Eastern";levels(stem$Ethnic)[9]="Asian";levels(stem$Ethnic)[9]="NA";levels(stem$Ethnic)[9]="White";levels(stem$Ethnic)[9]="White";levels(stem$Ethnic)[6]="NA";


levels(nonstem$Ethnic)[1]="NA";levels(nonstem$Ethnic)[2]="Caucasian";levels(nonstem$Ethnic)[3]="Asian";levels(nonstem$Ethnic)[4]="American";levels(nonstem$Ethnic)[5]="American";levels(nonstem$Ethnic)[5]="American";levels(nonstem$Ethnic)[5]="American";levels(nonstem$Ethnic)[5]="American";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";
levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="Asian";levels(nonstem$Ethnic)[5]="NA";levels(nonstem$Ethnic)[5]="NA";levels(nonstem$Ethnic)[5]="Latino/Hispanic";levels(nonstem$Ethnic)[6]="NA";levels(nonstem$Ethnic)[6]="Latino/Hispanic";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[6]="Caucasian";levels(nonstem$Ethnic)[7]="Asian";levels(nonstem$Ethnic)[7]="Asian";levels(nonstem$Ethnic)[7]="Asian";levels(nonstem$Ethnic)[7]="Latino/Hispanic";levels(nonstem$Ethnic)[7]="Latino/Hispanic";levels(nonstem$Ethnic)[7]="NA";levels(nonstem$Ethnic)[7]="Asian";levels(nonstem$Ethnic)[7]="Asian";levels(nonstem$Ethnic)[7]="Middle Eastern";levels(nonstem$Ethnic)[8]="Middle Eastern";levels(nonstem$Ethnic)[8]="Latino/Hispanic";levels(nonstem$Ethnic)[8]="Middle Eastern";levels(nonstem$Ethnic)[8]="Middle Eastern";levels(nonstem$Ethnic)[8]="Middle Eastern";levels(nonstem$Ethnic)[8]="NA";levels(nonstem$Ethnic)[8]="White";levels(nonstem$Ethnic)[9]="Caucasian";levels(nonstem$Ethnic)[9]="Caucasian";levels(nonstem$Ethnic)[9]="Caucasian";levels(nonstem$Ethnic)[9]="Caucasian";levels(nonstem$Ethnic)[9]="NA";levels(nonstem$Ethnic)[9]="NA";levels(nonstem$Ethnic)[9]="American";levels(nonstem$Ethnic)[9]="American";levels(nonstem$Ethnic)[9]="Caucasian";levels(nonstem$Ethnic)[9]="Middle Eastern";levels(nonstem$Ethnic)[9]="Asian";levels(nonstem$Ethnic)[9]="NA";levels(nonstem$Ethnic)[9]="White";levels(nonstem$Ethnic)[9]="White";levels(nonstem$Ethnic)[6]="NA";


```


```{r,echo=FALSE}
data2=rbind(stem,nonstem)

ggplot(data=data2, mapping=aes(x=STEM,fill=Ethnic))+
  geom_bar(position = "dodge",width=0.5)+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9","red","orange","green","pink"))+
  theme_minimal() + labs(title="Ethnic of STEM or NON-STEM Major Students")

```

- For STEM and NON-STEM major students, Asian has the biggest population.

- There are much more STEM students than NON-STEM students in general, which shows more students tend to choose STEM majors over NON-STEM majors.


```{r,echo=FALSE}
levels(stem$MotherEdu)[1]="No Response";levels(stem$MotherEdu)[2]="No Response";levels(stem$MotherEdu)[5]="No Response";levels(stem$MotherEdu)[6]="No Response"

levels(nonstem$MotherEdu)[1]="No Response";levels(nonstem$MotherEdu)[2]="No Response";levels(nonstem$MotherEdu)[5]="No Response";levels(nonstem$MotherEdu)[6]="No Response";

suppressMessages(library(ggplot2,warn.conflicts = FALSE))

ggplot(data = data2,aes(x = STEM,fill=MotherEdu))+ geom_bar(position = "dodge") + labs(title="Mother's Education of STEM or NON-STEM Major Students")
```

- For the vaiable of MotherEdu has 5 levels: High school or less, Two-year college, Four-year college, Graduate or professional degree, and No Response. There are some answered "yes", "no", and "Are you transfer from community college? ", so we changed these answers to No Response.

- In general, the distribution of MotherEdu of NON-STEM students and the distribution of MotherEdu of STEM students are very similar. The most mothers are from Fou-year college and the fewest mothers are from two-year college. 



```{r,echo=FALSE,warning=FALSE}

levels(stem$FatherEdu)[1]="No Response";levels(stem$FatherEdu)[2]="No Response";levels(stem$FatherEdu)[5]="No Response";levels(stem$FatherEdu)[6]="No Response";


levels(nonstem$FatherEdu)[1]="No Response";levels(nonstem$FatherEdu)[2]="No Response";levels(nonstem$FatherEdu)[5]="No Response";levels(nonstem$FatherEdu)[6]="No Response";

mytable<-prop.table(table(stem$FatherEdu))
lbls <- paste(names(mytable), "\n", round(mytable,2), sep="")
pie(mytable, labels = lbls,
    main="Proportion of Father Education Level (STEM)",col=c("orange","#55DDE0","pink","green","purple"))


mytabl1<-prop.table(table(nonstem$FatherEdu))
lbls1 <- paste(names(mytabl1), "\n", round(mytabl1,2), sep="")
pie(mytabl1, labels = lbls1,
    main="Proportion of Father Education Level (NON-STEM)",col=c("orange","#55DDE0","pink","green","purple"))
```

- We can see from the pie plot, most of stem majors students' FatherEdu (38% ) are graduate or professional degree.

- However, most of nonstem majors students' father education (40%) are Four-year college degree.

```{r,echo=FALSE,warning=FALSE}
suppressMessages(library(knitr))
suppressMessages(library(ggpubr,warn.conflicts = FALSE))
data2$SameEthnic <- as.numeric(as.character(data2$SameEthnic))
data2$OtherEthnic <- as.numeric(as.character(data2$OtherEthnic))

data2$SameEthnic[which.max(format(data2$SameEthnic,scientific=F))] <- 0 #outlier

A <- data2 %>% group_by(STEM) %>% dplyr::summarise(same_ethnic = format(mean(na.omit(SameEthnic)),scientific=F), n=n())
kable(A)

B <- data2 %>% group_by(STEM) %>% dplyr::summarise(other_ethnic = mean(na.omit(OtherEthnic)), n=n())
kable(B)
```

- After we drop one ourlier, STEM students and NON-STEM students have about the same amount number of friends from their own ethnic. And STEM major students have more friends from other ethnic than NON-STEM students. 


```{r,echo=FALSE}
#summary(stem$Orientation)
stem$Orientation <- factor(stem$Orientation)
#table(stem$Orientation)
suppressMessages(library(plyr,warn.conflicts = FALSE))
suppressMessages(library(dplyr,warn.conflicts = FALSE))
levels(stem$Orientation)[levels(stem$Orientation)=="straight"] <- "Heterosexual"
levels(stem$Orientation)[levels(stem$Orientation)==""] <- "I prefer not to say"
barplot(table(stem$Orientation),main="Barplot of Orientation of STEM students")
```

```{r,echo=FALSE}
nonstem$Orientation <- factor(nonstem$Orientation)
#table(nonstem$Orientation)
suppressMessages(library(plyr,warn.conflicts = FALSE))
suppressMessages(library(dplyr,warn.conflicts = FALSE))
levels(nonstem$Orientation)[levels(nonstem$Orientation)=="straight"] <- "Heterosexual"
levels(nonstem$Orientation)[levels(nonstem$Orientation)==""] <- "I prefer not to say"
barplot(table(nonstem$Orientation),main="Barplot of Orientation of NON-STEM students")
```

- The sexual orientations of the majority of people from STEM or NON-STEM majors are heterosexual.

## What are some factors that may impact the level of stress for STEM and NON-STEM students?
```{r,echo=FALSE,warning=FALSE}
data2%>%group_by(STEM,Year) %>% dplyr::summarise(mean_stress = mean(Stress)) %>% ggplot(aes(x=STEM,y=mean_stress, fill= Year)) + geom_bar(stat="identity", color = "Black",position=position_dodge()) + labs(title="Mean Stress Level of STEM/NON-STEM Students Among Different Standings")

```

- For NON-STEM students, graduate students have the smallest stress level. Senior has the largest stress level. Freshman, junior, and sophmores have similar stress levels.

- For STEM students, freshman students have the biggest stress level and fifth-year students have the second biggest stress level. Junior, senior and sophomore have similar stress levels.


```{r,echo=FALSE,warning=FALSE}
suppressMessages(library(dplyr,warn.conflicts = FALSE))
suppressMessages(library(ggplot2,warn.conflicts = FALSE))

data2 %>% group_by(STEM, FamilyValue) %>% dplyr::summarise(stress = mean(Stress)) %>% ggplot(aes(x=STEM, y=stress, fill=FamilyValue)) + geom_bar(stat="identity", color="black", position=position_dodge()) + scale_fill_brewer(palette="Blues") + labs(title="Average Stress Level of STEM/NON-STEM students with Different Expectations")


```

- For NON-STEM students, when their families have low expectations for them, they tend to have lower stress.

- But for STEM students, when their families have low expectations for them, they tend to have high stress.


```{r,echo=FALSE}

stem$Stress <- as.numeric(as.character(stem$Stress))


data2 %>% group_by(Transfer, STEM) %>% dplyr::summarise(stress = mean(Stress)) %>% ggplot(aes(x=Transfer, y=stress, fill=STEM)) + geom_bar(stat="identity", color="black", position=position_dodge()) + scale_fill_brewer(palette="Blues") + labs(title="Average Stress of STEM or NON-STEM students v.s. Transfer or Not")

```

- For STEM or NON-STEM students, whether they are transfer students or not does not affect their stress level that much.


```{r,echo=FALSE}
stem=stem[which(stem$International=="Yes"|stem$International=="No"),]
stem=stem[which(stem$FirstGen=="Yes"|stem$FirstGen=="No"),]
stem=stem[which(stem$Transfer=="Yes"|stem$Transfer=="No"),]

stem$GPA <- as.numeric(as.character(stem$GPA))
stem$International <- as.character(stem$International)

nonstem=nonstem[which(nonstem$International=="Yes"|nonstem$International=="No"),]
nonstem=nonstem[which(nonstem$FirstGen=="Yes"|nonstem$FirstGen=="No"),]
nonstem=nonstem[which(nonstem$Transfer=="Yes"|nonstem$Transfer=="No"),]

nonstem$GPA <- as.numeric(as.character(nonstem$GPA))
nonstem$International <- as.character(nonstem$International)

data3 <- rbind(stem,nonstem)
data3 %>% group_by(International, STEM) %>% dplyr::summarise(stress = mean(Stress)) %>% ggplot(aes(x=International, y=stress, fill=STEM)) + geom_bar(stat="identity", color="black", position=position_dodge()) + scale_fill_brewer(palette="Greens") + labs(title="Average Stress of STEM or NON-STEM students v.s. International or Not")

```

- From this graph, internation students tend to have lower stress than domestic students. And STEM students always have higher stress levels than NON-STEM students.

```{r,echo=FALSE}
gpa.levels <- c(1.0,1.5,2.0,2.5,3.0,3.2,3.4,3.6,3.8,4.0)
gpa.group <- cut(stem$GPA,gpa.levels)
plot(stem$Stress ~ gpa.group, main="Stress Level in Different GPA Range of STEM Students")

gpa.levels <- c(1.0,1.5,2.0,2.5,3.0,3.2,3.4,3.6,3.8,4.0)
gpa.group <- cut(nonstem$GPA,gpa.levels)
plot(nonstem$Stress ~ gpa.group, main="Stress Level in Different GPA Range of NON-STEM Students")
```

- The average value of GPA from 3.0 to 4.0 is relatively average, and the pressure average of 3.8 to 4.0 is slightly lower. Average pressure is slightly higher when students in the GPA range 2.0 to 3.0. Students in this range will be more likely to feel the pressure, probably because they worry that their GPA is not enough to graduate.

- The variation of NON-STEM students’ stress levels are a lot higher than STEM students’ stress levels. NON-STEM students have the highest stress level when their gpa is between 2.5 to 3.0. 



## Over findings from Q2.1-Q2.5 and Q3.1-Q3.24.
```{r,echo=FALSE}
stem$Q2.1 <- ordered(stem$Q2.1, levels = c("Never", "Rarely", "Sometimes", "Often", "Always",""))
stem$Q2.1[stem$Q2.1 == ''] = NA
stem$Q2.1 = droplevels(stem$Q2.1)
#levels(stem$Q2.1)
#summary(stem$Q2.1)

stem$Q2.2 <- ordered(stem$Q2.2, levels = c("Never", "Rarely", "Sometimes", "Often", "Always",""))
stem$Q2.2[stem$Q2.2 == ''] = NA
stem$Q2.2 = droplevels(stem$Q2.2)
#levels(stem$Q2.2)
#summary(stem$Q2.2)

stem$Q2.3 <- ordered(stem$Q2.3, levels = c("Never", "Rarely", "Sometimes", "Often", "Always",""))
stem$Q2.3[stem$Q2.3 == ''] = NA
stem$Q2.3 = droplevels(stem$Q2.3)
levels(stem$Q2.3) <- c(levels(stem$Q2.3),"Never")
stem$Q2.3 <- ordered(stem$Q2.3, levels = c("Never", "Rarely", "Sometimes", "Often", "Always"))
#levels(stem$Q2.3)
#summary(stem$Q2.3)

stem$Q2.4 <- ordered(stem$Q2.4, levels = c("Never", "Rarely", "Sometimes", "Often", "Always",""))
stem$Q2.4[stem$Q2.4 == ''] = NA
stem$Q2.4 = droplevels(stem$Q2.4)
#levels(stem$Q2.4)
#summary(stem$Q2.4)

suppressMessages(library(forcats,warn.conflicts = FALSE))
stem$Q2.5 <- ordered(stem$Q2.5, levels = c("Never", "Rarely", "Sometimes", "Often", "Always"))
stem$Q2.5 <-fct_drop(stem$Q2.5, only = "")
#levels(stem$Q2.5)
#summary(stem$Q2.5)

question2 <- table(stem[19])
for(i in 20:23){
  question2 <- rbind(question2, table(stem[i]))
}
rownames(question2) <- names(stem)[19:23]

heatmap(question2, Colv = NA, Rowv = NA, scale = "row", labCol = c(  "never","rarely", "sometime","often", "always"),cexRow = 1.5,cexCol = 1)
```

- From this heatmap, we can tell that most people sometimes get enough sleep. Most people ralely miss classes. Most people always do their homework. Most people exercise sometimes. Most people ralely go to office hours.


```{r,echo=FALSE}
stem$Q3.1 <- ordered(stem$Q3.1, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.1[stem$Q3.1 == ''] = NA
stem$Q3.1 = droplevels(stem$Q3.1)
#levels(stem$Q3.1)
#summary(stem$Q3.1)

stem$Q3.2 <- ordered(stem$Q3.2, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.2[stem$Q3.2 == ''] = NA
stem$Q3.2 = droplevels(stem$Q3.2)
#levels(stem$Q3.2)
#summary(stem$Q3.2)

stem$Q3.3 <- ordered(stem$Q3.3, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.3[stem$Q3.3 == ''] = NA
stem$Q3.3 = droplevels(stem$Q3.3)
#levels(stem$Q3.3)
#summary(stem$Q3.3)

stem$Q3.4 <- ordered(stem$Q3.4, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.4[stem$Q3.4 == ''] = NA
stem$Q3.4 = droplevels(stem$Q3.4)
#levels(stem$Q3.4)
#summary(stem$Q3.4)

stem$Q3.5 <- ordered(stem$Q3.5, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.5[stem$Q3.5 == ''] = NA
stem$Q3.5 = droplevels(stem$Q3.5)
#levels(stem$Q3.5)
#summary(stem$Q3.5)

stem$Q3.6 <- ordered(stem$Q3.6, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.6[stem$Q3.6 == ''] = NA
stem$Q3.6 = droplevels(stem$Q3.6)
#levels(stem$Q3.6)
#summary(stem$Q3.6)

stem$Q3.7 <- ordered(stem$Q3.7, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.7[stem$Q3.7 == ''] = NA
stem$Q3.7 = droplevels(stem$Q3.7)
#levels(stem$Q3.7)
#summary(stem$Q3.7)

stem$Q3.8 <- ordered(stem$Q3.8, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.8[stem$Q3.8 == ''] = NA
stem$Q3.8 = droplevels(stem$Q3.8)
#levels(stem$Q3.8)
#summary(stem$Q3.8)

stem$Q3.9 <- ordered(stem$Q3.9, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.9[stem$Q3.9 == ''] = NA
stem$Q3.9 = droplevels(stem$Q3.9)
#levels(stem$Q3.9)
#summary(stem$Q3.9)

stem$Q3.10 <- ordered(stem$Q3.10, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.10[stem$Q3.10 == ''] = NA
stem$Q3.10 = droplevels(stem$Q3.10)
#levels(stem$Q3.10)
#summary(stem$Q3.10)

stem$Q3.11 <- ordered(stem$Q3.11, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.11[stem$Q3.11 == ''] = NA
stem$Q3.11 = droplevels(stem$Q3.11)
#levels(stem$Q3.11)
#summary(stem$Q3.11)

stem$Q3.12 <- ordered(stem$Q3.12, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.12[stem$Q3.12 == ''] = NA
stem$Q3.12 = droplevels(stem$Q3.12)
#levels(stem$Q3.12)
#summary(stem$Q3.12)

stem$Q3.13 <- ordered(stem$Q3.13, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.13[stem$Q3.13 == ''] = NA
stem$Q3.13 = droplevels(stem$Q3.13)
#levels(stem$Q3.13)
#summary(stem$Q3.13)

stem$Q3.14 <- ordered(stem$Q3.14, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.14[stem$Q3.14 == ''] = NA
stem$Q3.14 = droplevels(stem$Q3.14)
#levels(stem$Q3.14)
#summary(stem$Q3.14)

stem$Q3.15 <- ordered(stem$Q3.15, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.15[stem$Q3.15 == ''] = NA
stem$Q3.15 = droplevels(stem$Q3.15)
#levels(stem$Q3.15)
#summary(stem$Q3.15)

stem$Q3.16 <- ordered(stem$Q3.16, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.16[stem$Q3.16 == ''] = NA
stem$Q3.16 = droplevels(stem$Q3.16)
#levels(stem$Q3.16)
#summary(stem$Q3.16)


stem$Q3.17 <- ordered(stem$Q3.17, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.17[stem$Q3.17 == ''] = NA
stem$Q3.17 = droplevels(stem$Q3.17)
#levels(stem$Q3.17)
#summary(stem$Q3.17)

stem$Q3.18 <- ordered(stem$Q3.18, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.18[stem$Q3.18 == ''] = NA
stem$Q3.18 = droplevels(stem$Q3.18)
#levels(stem$Q3.18)
#summary(stem$Q3.18)

stem$Q3.19 <- ordered(stem$Q3.19, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.19[stem$Q3.19 == ''] = NA
stem$Q3.19 = droplevels(stem$Q3.19)
#levels(stem$Q3.19)
#summary(stem$Q3.19)

stem$Q3.20 <- ordered(stem$Q3.20, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.20[stem$Q3.20 == ''] = NA
stem$Q3.20 = droplevels(stem$Q3.20)
#levels(stem$Q3.20)
#summary(stem$Q3.20)

stem$Q3.21 <- ordered(stem$Q3.21, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.21[stem$Q3.21 == ''] = NA
stem$Q3.21 = droplevels(stem$Q3.21)
#levels(stem$Q3.21)
#summary(stem$Q3.21)

stem$Q3.22 <- ordered(stem$Q3.22, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.22[stem$Q3.22 == ''] = NA
stem$Q3.22 = droplevels(stem$Q3.22)
#levels(stem$Q3.22)
#summary(stem$Q3.22)

stem$Q3.23 <- ordered(stem$Q3.23, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.23[stem$Q3.23 == ''] = NA
stem$Q3.23 = droplevels(stem$Q3.23)
#levels(stem$Q3.23)
#summary(stem$Q3.23)

stem$Q3.24 <- ordered(stem$Q3.24, levels = c("","Strongly Disagree","Disagree","Not Sure","Agree","Strongly Agree"))
stem$Q3.24[stem$Q3.24 == ''] = NA
stem$Q3.24 = droplevels(stem$Q3.24)
#levels(stem$Q3.24)
#summary(stem$Q3.24)

question3 <- table(stem[24])
for(i in 25:47){
  question3 <- rbind(question3, table(stem[i]))
}
rownames(question3) <- names(stem)[24:47]

heatmap(question3, Colv = NA, Rowv = NA, scale = "row", labCol = c("StronglyDisagree","Disagree","NotSure","Agree","StronglyAgree"),cexRow = 1,cexCol = 0.7)
```

- From Q3.3 and Q3.4, most people disagree that their families have struggled when they grow up and they claim that they don't have to work to pay for their expenses. This is interesting because it shows that people who go to UCLA are less likely to come from a poor background. 

- In terms of social life, (Q3.7) most people disagree that they make friends from their own majors. And (Q3.11) most people don't have trouble with roommates. From Q3.23, most people feel happy at UCLA.



## Overall findings from each of the 2 open-ended questions. (HelpFactor & InbibitFactor)

```{r,warning=FALSE,echo=FALSE}

suppressMessages(library(wordcloud,warn.conflicts = FALSE))
suppressMessages(library(RColorBrewer,warn.conflicts = FALSE))
suppressMessages(library(wordcloud2,warn.conflicts = FALSE))
suppressMessages(library(tm,warn.conflicts = FALSE))

#HelpFactor: Please describe the factors that have helped you succeed academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened.
set.seed(12345)
wordcloud(words = data2$HelpFactor, min.freq = 1, max.words=200, random.order=FALSE, rot.per=0.35,colors=brewer.pal(8, "Dark2"))
```

- The question is asked for this variable is: Please describe the factors that have helped you succeed academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened.

- The most frequent words show on student's responses are Friends, Helped, Support, Help, Family, ucla, etc. 

- Friends and family usually play big roles in supporting everyone. They provide emotionally, financially, and academically support for ucla students. 

```{r,warning=FALSE,echo=FALSE}
#InhibitFactor:Please describe the factors that have inhibited your success academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened.
set.seed(12345)
wordcloud(words = data2$InhibitFactor, min.freq = 3, max.words=800, random.order=FALSE, rot.per=0.001,colors=brewer.pal(8, "Dark2"))
```

- The question is asked for this variable is: Please describe the factors that have inhibited your success academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened.

- Top frequent words based on responses are ucla, classes, students, people, time, etc. 

- Surprisely, classes, ucla, people, students are the keywords of inhibiting students succeeding. It would be interesting to do more research or send out more surveys on this topic. 

\section{Hypothesis Testing}

```{r,echo=FALSE}

#Ho: mean Stress of stem=nonstem
#two side of test
t.test(Stress~STEM,data2,mu=0,alt="two.sided",cof=0.95,var.eq=F,paired=F)

```

- H0: The mean stress level among STEM and NON-STEM students are the same.

- HA: The mean stress level among STEM and NON-STEM students are different.

- Based on the results of two sample t-test, the p value is 0.3772 which is greater than 0.05. Therefore, we reject H0 and accept HA, which is there is a significant difference between the stress level of STEM students and the stress level of NON-STEM students.


\section{Variables Significance Test}

- In order to convinient our variables selecting and our model study, we decide to put our response variable stress in to two levels, below median and above median.

```{r,echo=FALSE}
suppressMessages(library(dplyr,warn.conflicts = FALSE))
data6=read.csv("newstem.csv",head=TRUE)

data6=data6[complete.cases(data6[,51:55]),]

stem=data6[which(data6$STEM=="Yes"),]
nonstem=data6[which(data6$STEM=="No"),]

stem=stem[which(stem$Gender!="Genderfluid"&stem$Gender!="Transgender female"),]
stem = na.omit(stem)

stem=stem[which(stem$International=="Yes"|stem$International=="No"),]
stem$International <- as.character(stem$International)
stem$GPA <- as.numeric(as.character(stem$GPA))

# Look for the mean and median values of stress
mean <- mean(stem$Stress,na.rm=TRUE)
med<- median(stem$Stress,na.rm=TRUE)

# Cut the data into two levels
stem$Stress.factor<- cut(stem$Stress, breaks=c(6.3,med,100),
labels=c("Below Median", "Above Median"))
C <- summary(stem$Stress.factor)
kable(C)
```

- Also, we put the questions that we concern within Question 2 and 3 parts into three levels.

```{r,echo=FALSE}
suppressMessages(library(car,warn.conflicts = FALSE))
# Q2.1
stem$Q2.1<- recode(stem$Q2.1,"'Always'='Often'; 'Never'='Rarely'")
#summary(stem$Q2.1)

# Q2.4
stem$Q2.4<- recode(stem$Q2.4,"'Always'='Often'; 'Never'='Rarely'")
#summary(stem$Q2.4)

# Q3.6
stem$Q3.6<- recode(stem$Q3.6,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.6)

# Q3.7
stem$Q3.7<- recode(stem$Q3.7,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.7)

# Q3.10
stem$Q3.10<- recode(stem$Q3.10,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.10)

# Q3.11
stem$Q3.11<- recode(stem$Q3.11,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.11)

# Q3.12
stem$Q3.12<- recode(stem$Q3.12,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.12)

# Q3.24
stem$Q3.24<- recode(stem$Q3.24,"'Strongly Agree'='Agree'; 'Strongly Disagree'='Disagree'")
#summary(stem$Q3.24)
```


- After resetting the variables, we do the logistic regression model, check for pseudo R square and confidence interval and check the effect plots to check variables' significance and interaction term.

- Our main focus would be on students' academic stress, friendship(roommates) stress, and emotion(dating) stress, also we would study for the interaction of International(or not) and Q3.6(eager to work or not) since we are international students and some of us would be getting jobs very soon.

## First model: add Q3.10(I experience anxiety about academics.)

```{r,echo=FALSE}
test1 <- glm(Stress.factor ~ Q2.1+ Year+ EFL+ Transfer+ Q2.4+ GPA+ SameEthnic +Q3.6+Q3.7+Q3.10+Q3.24 ,  data = stem, family="binomial")
summary(test1)
```

- Based on the logistic regression summary report, we can notice that while including Q3.10, this variable has the most significant level. Besides, Q2.4(I exercise.), Q2.1Rarely(I get enough sleep.),Q3.6 Disagree(I need to graduate and get a job as soon as possible.) and Q3.24Disagree(My experiences at UCLA have helped me to interact with diverse groups.) also have some significance.




- Now we check the pseudo R square. The value is between 0.2-0.4, which is considered fitted well for our model. So we can say that those variables we have used in our model "test1" are overall good.



- Here we check for the confidence interval(CI) for the variables. From the CI, we can interpret the followings:

- 1. The effects of Q2.1Rarely, Q2.4Rarely, Q3.6Disagree, Q3.10Disagree, Q3.10Not Sure and Q3.24Disagree do have a significant influence on feeling stress, since these variables have CI that don't include 1.

- 2. For Q2.1(I get enough sleep.), we can conclude that, for those who answered "rarely" have 87% more chance than feeling stressed than those who have enough sleep.

- 3. For Q2.4(I exercise.) we can conclude that, for those who answered "rarely" have 2.01 times more chance of feeling stressed than those who do exercise.

- 4. For Q3.6(I need to graduate and get a job as soon as possible.), we can conclude that, for those who answered "Disagree" have 0.46 times less chance than feeling stressed than those who don't worry about getting a job as soon as possible.

- 5. For Q3.10(I experience anxiety about academics.), we can conclude that, for those who answered "Disagree" have 0.98 times less chance than feeling stressed and for those who answered "Not Sure" have 0.92 times less chance than feeling stressed than those who don't anxiety.

- 6. For Q3.24(My experiences at UCLA have helped me to interact with diverse groups.), we can conclude that, for those who answered "Disagree" have 1.98 times more chance of feeling stressed than those who think UCLA have helped them to interact with diverse groups.


```{r,echo=FALSE}
(library(effects,warn.conflicts = FALSE))
plot(allEffects(test1))[1,1]
```

- In these plots we can interpret that:
  
  - Those who have rarely sleep, or at their junior year, or their English are not their first language, or transfer students, or rarely excercise, or have higher GPA(in the range of 0 to 4), or have less same ethnic friends(in the range of 0 to 800), or experience anxiety about academics, or think their experiences at UCLA have not helped them to interact with diverse groups are having higher stress feeling.

- Those who think they don't need to graduate and get a job as soon as possible are having less stress feeling.

- Whether or not that most of friends are from their major does not vary their stress level overally.

- For Q3.10(I experience anxiety about academics.), those who have answered "Agree" are obviously have much higher stress feelings than who answered "Disagree".



## Second model: add 3.11(I experience anxiety about getting along with my roommates.)

```{r,echo=FALSE}
test2 <- glm(Stress.factor ~ Q2.1+ Year+ EFL+ Transfer+ Q2.4+ GPA+ SameEthnic +Q3.6+Q3.7+Q3.11+Q3.24 ,  data = stem, family="binomial")
summary(test2)

```

- Based on the logistic regression summary report, we can notice that while including Q3.11, this variable has the most significant level. Besides, Q2.4(I exercise.), Q2.1Rarely(I get enough sleep.),Q3.6Disagree(I need to graduate and get a job as soon as possible.) also have some significance.




- Now we check the pseudo R square. The value is between 0.2-0.4, which is considered fitted well for our model. So we can say that those variables we have used in our model "test2" are overall good.




- Here we check for the confidence interval(CI) for the variables. From the CI, we can interpret the followings:

- 1. The effects of Q2.1Rarely, Q2.4Rarely, Q3.6Disagree, Q3.11Disagree, and Q3.11Not Sure do have a significant influence on feeling stress, since these variables have CI that don't include 1.

- 2. For Q2.1(I get enough sleep.), we can conclude that, for those who answered "rarely" have 2.11 times more chance of feeling stressed than those who have enough sleep.

- 3. For Q2.4(I exercise.), we can conclude that, for those who answered "rarely" have 2.17 times more chance of feeling stressed than those who do exercise.

- 4. For Q3.6(I need to graduate and get a job as soon as possible.), we can conclude that, for those who answered "Disagree" have 0.49 times less chance than feeling stressed than those who don't worry about getting a job as soon as possible.

- 5. For Q3.11(I experience anxiety about academics.), we can conclude that, for those who answered "Disagree" have 0.98 times less chance than feeling stressed and for those who answered "Not Sure" have 0.85 times less chance than feeling stressed than those who don't anxiety.


```{r,echo=FALSE}
suppressMessages(library(effects,warn.conflicts = FALSE))
plot(allEffects(test2))
```

- In these plots we can interpret that:
  
  - Most findings are similiar as what we have found above(in test1).

- For "Q3.6: I need to graduate and get a job as soon as possible.", those who have answered "Agree" have much higher stress feelings than others.

- For "Q3.7: Most of my friends are from own major.", those who have answered "Agree" are obviously have much lower stress feelings than who answered "Disagree".

- For "Q3.11: I experience anxiety about getting along with my roommates.", those who have answered "Agree" are obviously have much higher stress feelings than who answered "Disagree".




## Third model: add Q3.12(I experience anxiety with my dating life.)

```{r,echo=FALSE}
test3 <- glm(Stress.factor ~ Q2.1+ Year+ EFL+ Transfer+ Q2.4+ GPA+ SameEthnic +Q3.6+Q3.7+Q3.12+Q3.24, data = stem, family="binomial")
summary(test3)

```

- Based on the logistic regression summary report, we can notice that Q3.12, Q2.4Rarely(I exercise.), Q2.1Rarely(I get enough sleep.),Q3.6Disagree(I need to graduate and get a job as soon as possible.), and Q3.24Disagree(My experiences at UCLA have helped me to interact with diverse groups.) have significance while doing our model prediction.



- Now we check the pseudo R square. The value is between 0.2-0.4, which is considered fitted well for our model. So we can say that those variables we have used in our model "test3" are overall good.



- Here we check for the confidence interval(CI) for the variables. From the CI, we can interpret the followings:
  
  - 1. The effects of Q2.1Rarely, Q2.4Rarely, Q3.6Disagree, Q3.12Disagree, Q3.12Not Sure, and Q3.24Disagree do have a significant influence on feeling stress, since these variables have CI that don't include 1.

- 2. For Q2.1(I get enough sleep.), we can conclude that, for those who answered "rarely" have 2.56 times more chance of feeling stressed than those who have enough sleep.

- 3. For Q2.4(I exercise.), we can conclude that, for those who answered "rarely" have 2.76 times more chance of feeling stressed than those who do exercise.

- 4. For Q3.6(I need to graduate and get a job as soon as possible.), we can conclude that, for those who answered "Disagree" have 0.37 times less chance than feeling stressed than those who don't worry about getting a job as soon as possible.

- 5. For Q3.12(I experience anxiety about academics.), we can conclude that, for those who answered "Disagree" have 0.97 times less chance than feeling stressed and for those who answered "Not Sure" have 0.88 times less chance than feeling stressed than those who don't anxiety.

- 6. For Q3.24(My experiences at UCLA have helped me to interact with diverse groups.), we can conclude that, for those who answered "Disagree" have 2.49 times more chance of feeling stressed than those who think UCLA has helped them to interact with diverse groups.


```{r,echo=FALSE}
suppressMessages(library(effects,warn.conflicts = FALSE))
plot(allEffects(test3))
```

- In these plots we can interpret that:

- Most findings are similiar as what we have found above(in test2).

- Whether or not that most of friends are from their major does not vary their stress level overally.

- For "Q3.12: I experience anxiety with my dating life.", those who have answered "Agree" are obviously have much higher stress feelings than who answered "Disagree".



## Interaction plot between International and Q3.6

```{r,echo=FALSE}
test4 <- glm(Stress.factor ~ International *Q3.6  ,  data = stem, family="binomial")
summary(test4)

```

- Based on the model analysis, we find that "InternationalYes:Q3.6Disagree" has significant related to our response value stress.

```{r, warning=FALSE,echo=FALSE}
round(exp(cbind(Estimate=coef(test4), confint(test4))),2)
```

- Doing the CI test, we can support our finding above. "InternationalYes:Q3.6Disagree" can affect the "Stress" value. 

- We can say that, for those who are international students and they don't feel they need to graduate and  get a job soon, are having 0.64 less stress feeling.

```{r,echo=FALSE}
suppressMessages(library(effects,warn.conflicts = FALSE))
plot(allEffects(test4))
```

- From the interaction plot above, we conclude that:
  
  - 1. Within those who think the need to graduate and get a job soon, International students and not international students don't vary to much on stress feelings.

- 2. Within Those who don't think the need to graduate and get a job soon, International Students are having much less stress than all other students, and not international students also feel less stress than other not international students.

\section{Summary of Results}

- Students have high anxiety of their academics, daily life(friendship, roommates, and dating) would have higher stress feeling.

- People who have less sleep time and not doing exercise tend to have higher stress.

- Making more friends, especially with the same major, would help disperse stress.

- Students who are concerned about getting jobs soon after their graduation may have higher stress.

- Transferring or not doesn't show a big difference on stress feeling level.

- Junior students generally are facing more stress than other year undergraduates.

- International students who are also not considering having a job soon after graduation have much less stress than others. 

\section{Challenges of the Study}

- Our dataset is not big enough for our variables tests. For example, we have a lot of categorical variables so that our degree of freedom for the logistic models are large considering our eight-hundred sample size.

- Our dataset is really messy, but this is also very natural, and we spend a lot of energy on cleaning variables and creating new variables.

- While doing the variables selection, we find out most of the variables don’t have much significance relationship with our response variable stress. The most three significant variables are all the questions asked directly about participants' anxiety feeling level. So we decided to also look for some other variables that we are interested in as well as show some significance based on our studies. 


\section{Recommendation for the future}

- For future study, we recommend improving the questions of the survey. After we cleaned the data, we found that many students were too free to fill in unrealistic answers. As a result, we had to abandon the data of a small number of students. If we set the survey as a wide range of multiple-choice questions instead of open-ended questions, it will help us to get a better dataset. We can also apply this survey to students in other schools, so we can collect more data to make models.

