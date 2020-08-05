# STATS-141SL-STEM-Survey-Analysis
Members: Mengxuan Sun, Yuqing Yang, Xinyi Wang, Chengcheng Xu

## Goal

Explore hich variables affect the level of stress among STEM students and NON-STEM students

## Background
Stress among college students can be overwhelming and can affect many areas of a student’s life. Different majors lead to different levels of workload and cause different levels of stress. There are two main divisions of major selection nowadays: STEM and NON-STEM. STEM stands for science, technology, engineering, and math. In the survey, students report if they study STEM majors or not. Students also evaluate their own stress levels at the end of the questionnaire.

## Clear Statement of the Problems to be sloved 

1. Overall findings from comparing STEM with NON-STEM majors.
2. What are some factors that may impact the level of stress for STEM and Non-STEM students?
3. Over findings from Q2.1 - Q2.5 and Q3.1 - Q3.24.
4. Overall findings from each of the 2 open-ended questions. (HelpFactor & InbibitFactor)
5. Hypothesis Testing

## Variable of the Study 

See attached code book

## Data Cleaning

We dropped some problematics rows and columns. We also checked the data type of each column. 

## Exploratory Data Analysis

We used variaty data visualization methods such as bar plots, grouped bar charts, pie plots, proportional tables and boxplots to visualize the information from the data. 

We normalized the data and performed heatmap() function and built two heatmaps graphs to investigate question Q2.1~Q2.5 and Q3.1~Q3.24.

We also used the text mining wordcloud() function to build two word cloud graphs to show the most frequent words of students' responses of the two open-ended questions: 
1. Please describe the factors that have helped you succeed academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened. 
2. Please describe the factors that have inhibited your success academically, socially, emotionally, or otherwise at UCLA? It would be great if you can provide us with examples or tell us a story about something that happened.

## Hypothesis Testing

- H0: The mean stress level among STEM and NON-STEM students are the same.
- HA: The mean stress level among STEM and NON-STEM students are different.
- Based on the results of two sample t-test, the p value is 0.3772 which is greater than 0.05. Therefore, we reject H0 and accept HA, which is there is a significant difference between the stress level of STEM students and the stress level of NON-STEM students.

## Variables Siginicance Test

First, we decide to put our response variable 'Stress' into two levels: below median and above median. We also divided variables from questionnaire part 2 and 3 into three levels. 

Next, we performed the logistic regression model. We used pesudo R square, corresponding confidence interval, and the effect plots to check the significance of each variable and the interaction terms. 

## Summary of Results

1. Students have high anxiety of their academics, daily life(friendship, room- mates, and dating) would have higher stress feeling.

2. People who have less sleep time and not doing exercise tend to have higher stress.

3. Making more friends, especially with the same major, would help disperse stress.

4. Students who are concerned about getting jobs soon after their gradua- tion may have higher stress.

5. Transferring or not doesn’t show a big difference on stress feeling level.

6. Junior students generally are facing more stress than other year under- graduates.

7. International students who are also not considering having a job soon after graduation have much less stress than others.
