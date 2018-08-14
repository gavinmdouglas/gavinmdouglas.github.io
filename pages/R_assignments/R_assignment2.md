---
layout: page
title: R Assignment 2
---

# Introduction

In this assignment you'll be building basic control structures, which are the key building blocks you'll need to write programs. There are two different sections (one on prime numbers and one on the Fibonnaci's rabbits problem), which will gradually become more complex as you add more to your control structures.

Answers to the below questions are available [here]({{ BASE_PATH }}/pages/R_workshops/R_ass2_answers.html). Checking that you're getting the correct answers will make sure that your R code is working.

## Identifying prime numbers

Prime numbers are whole numbers > 1 defined as only having factors of 1 and themselves. As of Jan 4th 2018 the largest known prime number is "M77232917", which is 23,249,425 digits. For the first problem of this assignment you'll need to determine the next biggest prime number after "M77232917". Well that *might* be overly ambitious, but for now let's imagine that was our goal! We'll need to figure out two things before we get started: (1) how to identify prime numbers programmatically and (2) reassure ourselves that our approach is working correctly.

The simplest way to identify is a number is a prime would be to check whether any of the numbers smaller than it are a factor. You can use the remainder (```%%```) operator in R for this purpose. This reports how much is left over after dividing one number by another.

For instance, 0 is left over after dividing 4 by 2 since 2 is a factor:
```{r}
4 %% 2
```

In contrast, dividing 10 by 3 has a remainder of 1.

```{r}
10 %% 3
```

To identify whether a given number is a prime, we can combine this remainder syntax with a ```for``` loop and ```if-else``` statements.

As a reminder, this syntax would look from the numbers 1 to 10 and print them:

```{r}
for(i in 2:10) {
  print(i)
}
```

**Q1:** Use a ```for``` loop and ```if-else``` statements to determine if 71 is a prime number.

If we wanted to check whether a different number was a prime we could simply copy and paste the
you wrote to answer the previous question and replace 71 with the new number of interest. However,
this can make your code needlessly confusing if you have many repetitive commands. It can also make your
prone very prone to typos, especially if you need to do this numerous times. An easier way of performing
this repetitive task is to write a function that will determine if a given number is prime.

As a reminder, here is an example of a defining and calling a function in R:

```{r}
multiply <- function(x, y) {
                product <- x * y
                return(product)
}

multiply(10, 5)
```

**Q2:** Put the code that you wrote above in a new function that accepts a number to check as the only argument. Determine if these numbers are prime: 229, 371, 4619

An important part of programming is making your code more efficient. In this case, we know that we know that if a number doesn't have 2 as a factor then it wont have any other even number as a factor either so there's no point checking all of them.

The ```seq``` function is useful for getting a range of numbers. For instance, ```seq(from=3, to=100, by=2)``` will return all numbers from 3 to 100 in steps of 2 (i.e. odd numbers).

We also know that once we *do* find a factor that we can stop checking other numbers. Using the ```break``` statement or using ```return``` in a function can be useful to avoid needless looping.

Write a new function that checks whether a number is prime, as above, but also (1) doesn't check all even numbers and (2) stops checking once a factor is found. It's possible that you included these features in your original function, in which case well done!

It can be useful to know whether you're actually making your code more efficient by timing how long it takes to execute.

One simple way to measure execution time in R is with the ```Sys.time``` function. You can use this function to get the time before and after you run commands and then look at the difference afterwards. For example:

```{r}
start.time <- Sys.time()
print("test")
end.time <- Sys.time()
end.time - start.time
```

**Q3:** How long does it take to check whether all numbers 2 to 1000 are prime with your original function? With your revised function?


**Q4:** How many prime numbers are there smaller than 10000?

## Recursive functions

The Fibonacci sequence is defined as the series of numbers (after 1) made up of summing the previous two numbers. So the start of the sequence is: 1, 1, 2, 3, 5, 8, 13, ...

This sequence is commonly brought up in biology in the context of spirals. In this part of the assignment we'll be using the Fibonacci sequence for a basic simulation of rabbit populations over time.

**Q5:** Write R code to generate the first 20 numbers of the Fibonacci sequence.

Rosalind is useful website for learning bioinformatics. There are problems on this website that can be solved using any programming language you like. These problems range from simple to sophisticated as you gradually build your skills. Take a look at this problem, which is based on the Fibonacci sequence: http://rosalind.info/problems/fib/

Write a function that will determine the total number of rabbit pairs after a given number of months and a given litter size based on the assumptions at the above link.

**Q6:** What's the total number of rabbit pairs present after 20 months given a litter size of 5?
