---
layout: page
title: R Assignment 4
---

### Introduction

Lecture 4 focused on statistical testing in R, making building linear models with ```lm```,
and basic simulations. This assignment will build on these concepts and also cover
some of the material presented in previous workshops as well.
Answers to the below questions are [here]({{ BASE_PATH }}/pages/R_assignments/R_assignment4_answers.html).

### Basic data exploration and testing

For this section we'll be using the ```chickwts``` default dataset, which contains
the weights of 71 chicks on 6 different feeds. We'll get some basic summaries of
this table and subset it before running a statistical test.

**Q1)** What's the mean chick weight? The standard deviation?

**Q2)** Plot boxplots of chick weight by each feed type.

**Q3)** How many rows correspond to the feed linseed? To meatmeal?

Remove all rows of this dataframe which correspond to linseed and meatmeal.

**Q4)** If you re-make the above boxplots with this subsetted table categories
for linseed and meatmeal will still be present. Why is this?

When doing data analysis in R it's common to come across a new function that you
need to quickly familiarize yourself with. We looked at a few different R testing
functions like ```wilcox.test``` during the lecture, which is for testing for statistical
differences between groups. The Kruskal-Wallis test is the equivalent method used
when there are multiple groups, which can be used in R with the ```kruskal.test```
function.

Take a look at the help documentation of this function with:
```
?kruskal.test
```

**Q5)** Run a Kruskal-Wallis test on the subsetted table for whether chick weight differs by feed type. What's the p-value?

### Randomization example

Sometimes for custom analyses you may need to come up with your own way of determining statistical significance.
Permutation tests are one example of a common custom test that you might need to write at some point in R.
In this section you'll perform some basic data analysis on the ```trees``` dataset and come up with a permutation test.

**Q6)** How many trees have a height greater or equal to 70 feet?

**Q7)** Plot scatterplots of all pairwise comparisons between tree height, girth, and volume as different panels of the same plot.

**Q8)** What's the Pearson correlation coefficient between tree volume and girth?

Let's imagine that we were interested specifically in the difference in the mean tree volume between trees higher than 75 feet compared to all other trees and that we want to test if these taller trees have greater volumes (i.e. a one-sided test).

**Q9)** What's the difference in the mean volume between these two tree groupings?

To check if this difference is higher than we'd expect by chance we can write a
permutation test. This test will involve taking the difference of the mean
volumes of 2 random groupings of this dataset that are the same sizes as the ones
used above. We'll make 10000 permutations for this test. **Note that we could use standard statistics to pose this question, but we'll use a permutation approach here as an example case.**

This test could be done by writing a ```for``` loop (to loop 10000 times) that
takes 2 random subsets of the dataset and keeps track of difference in the mean
volumes between the 2 subsets. This will be our null distribution. Where the
observed difference lies on this distribution will let us calculate a p-value.

**Q10)** What p-value did you calculate?

**Q11)** Plot a histogram of the null distribution you created and add the
observed value to the plot as a dotted red line.

### Building a binary classification model

During the lecture you were introduced to linear regressions, which works great for quantitative response variables. However, often in biology we're interested in classifying samples into 2 groups.
This exercise will introduce you to logistic regression, which can be used for this purpose.

We'll be using a custom dataset, which you can download [here]({{ BASE_PATH }}/assets/data/R_workshops/assignment4/ass4_training_set.txt). This is the training set,
which you should read into R using ```read.table```. We'll evaluate our model at
the end using a test set. This dataset consists of samples as rows and different variables as columns.
We're interested in classifying samples as "yes" or "no" based on an arbitrary condition column.
The other columns refer to the type of diet and also give arbitrary abundances of different prokaryotic genera.

A logistic regression model is a type of generalized linear model. You can build a logistic regression model using the ```glm``` function.

Run this command to build a model for classifying condition based on all other columns
(where MY_DATA is the name of the dataframe you read the input file into).

```{r}
cond_mod <- glm(formula = condition ~ ., family = binomial(link = "logit"), data = MY_DATA)
```

You may now drop any predictors from the model if you like as described in the lecture.

To determine the model accuracy we'll compare the predicted classes in our test set to the actual conditions for each sample. You can download the test set [here]({{ BASE_PATH }}/assets/data/R_workshops/assignment4/ass4_test_set.txt), which you should read into R.

You can get the predicted class probabilities with this command: (assuming the test dataframe is in ```in_test```):

```{r}
test_predictions <- predict(cond_mod, in_test, type="response")
```

Assume that all probabilities > 0.5 are "yes" and all probabilities <= 0.5 are "no".

**Q12)** What overall accuracy does your model have?

**Q13)** Did your model classify more "yes" or "no" condition samples correctly?

**Q14)** Now that you've tried your model on the test set once can you go back and change your model to see if you can improve performance on the test set?
