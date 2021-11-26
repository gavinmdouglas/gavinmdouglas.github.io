---
layout: page
title: R Assignment 4 Answers
---

Q1) mean of 261.3 and standard deviation of 78.1.

Q2)

<td class="left">
        <img src="{{ BASE_PATH }}/assets/plots/R_workshops/assignment4/chickwts_boxplots.png" alt="assets/plots/R_workshops/assignment4/chickwts_boxplots.png" title="chick boxplots" align="middle">
</td>

Q3) 12 linseed and 11 meatmeal

Q4) These categories are still levels of the "feed" column. The levels of this
factor would need to be re-defined first with ```chickwts$feed <- factor(chickwts$feed)```.

Q5) 3.402e-06

Q6) 26

Q7)

<td class="left">
        <img src="{{ BASE_PATH }}/assets/plots/R_workshops/assignment4/trees_scatterplots.png" alt="assets/plots/R_workshops/assignment4/trees_scatterplots.png" title="trees_scatterplots" align="middle">
</td>

Q8) R=0.967

Q9) 17.41

Q10) This should be highly significant - I got P=6e-04

Q11)

<td class="left">
        <img src="{{ BASE_PATH }}/assets/plots/R_workshops/assignment4/permutation_hist.png" alt="assets/plots/R_workshops/assignment4/permutation_hist.png" title="permutation_hist" align="middle">
</td>

Q12) Your model should have an accuracy of around 80%.

Q13) The model tends to call "yes" sample correctly more often.

Q14) No, that would result in overfitting your model to your test dataset.
