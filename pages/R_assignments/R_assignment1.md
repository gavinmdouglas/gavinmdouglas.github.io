---
layout: page
title: R workshops (August 2018)
---

### Introduction

In this assignment you'll be processing gene expression data from the
Inflammatory Bowel Disease Multi'Omics Database (https://ibdmdb.org/).

The raw data has already been processed and you'll be working with two main
files: (1) A table of sample metadata and (2) a table of gene expression levels.

Be sure to save your commands in an Rscript and remember that writing useful
comments is an important part of data analysis!

Answers to the below questions are available [here]({{ BASE_PATH }}/pages/R_workshops/R_ass1_answers.html).

### Download input files

Click these links to download the required [metadata table](https://www.dropbox.com/s/vumsydgpno42xj2/hmp2_metadata_rnaseq_reformat.tsv?dl=1) and the [RDS of RNA-seq read counts](https://www.dropbox.com/s/h3kstyij7ifhees/ileum_rna_counts.rds?dl=1).

### Read in input files

The RDS file is a special R file that can be read in directly as an object with
the ```readRDS``` function.

```hmp2_metadata_rnaseq_reformat.tsv``` is a tab-delimited table and can be read
in with the ```read.table``` command.

**Q1**: Take a look at the metadata table in R. What is the range of consent ages across all samples?

### Subset metadata table

For the below analyses we'll just be working with ileum biopsy samples from subjects with Crohn's disease and controls.

Create a new metadata table with the "UC" (ulcerative colitis) diagnosis removed and all other biopsy locations except for "Ileum" removed.

**Q2**: The first column in this file contains patient ids. How many patients have duplicated samples in this subsetted table? (Hint: try the ```table``` function)

Retain only 1 sample for each patient using the ```duplicated``` function. This function will return a logical vector for whether an element is a duplicate or not. For example:

```
duplicated("a", "b", "a", "c")
[1] FALSE FALSE  TRUE FALSE
```

**Q3**: How many males and females are in this subsetted table?

Now that we have the filtered metadata table you might want to save it as an RDS file so that you wont need to re-run these commands again in the future. You can do this with the ```saveRDS``` function.

### Exploring gene expression table

The table of gene expression levels is very large and so ```summary``` and ```str``` wont be very helpful. You can get the dimensions of the table with the ```dim``` function.

**Q4**: How many values (i.e. cells excluding column and row names) are in this table?

We need to subset the gene expression table to only those samples found in the metadata table. The sample names are the row names of the gene expression table (which you can see with ```rownames```).

**Q5**: Which column of the metadata table does this correspond to?

You can check for which elements of one vectors is present in another vector with ```which``` and ```%in%```. For example:

```
tmp <- c("a", "b", "c", "d", "e")
tmp2 <- c("c", "d", "e", "f", "g")
which(tmp %in% tmp2)
[1] 3 4 5
```

The above means that the elements with indices 3-5 in ```tmp``` were found in ```tmp2```.

**Q6**: How many samples in the gene expression table are not found in the metadata table?

The gene expression table is currently raw read counts. You can get the total read counts per sample with ```rowSums```.

**Q7**: Plot the read counts per sample as a histogram with ```hist```. You can save this plot to a PDF by clicking "Export".

You can normalize each sample's counts to be in reads per million (RPM) with the ```sweep``` command:

```
in_rnaseq_rpm <- sweep(in_rnaseq, 1, rowSums(in_rnaseq), '/') * 1e6
```

The arguments of this function used above are: (1) the gene expression table, (2) the margin to sweep over (1 means rows whereas 2 would mean columns), (3) summary statistic to be used (which is the sum of each row), and the function used (which is to divide). In total this means to divide each row by the sum of that row! We then multiplied this result by 1 million (1e6).

**Q8**: Which sample has the highest expression of BRINP3?

APOA1 and DUOX2 are two genes that are known to be negatively associated in the ileum of Crohn's disease patients. Make a scatterplot the normalized expression levels of these 2 genes with ```plot```.

```par``` is a useful function for changing plotting options in base graphics. You change the number of panels plotted to be 2 with this command:
```
par(mfrow=c(1,2))
```

**Q9**: Plot a similar scatterplot as above but for CD and non-IBD subjects only on each panel respectively.

**Q10**: Plot boxplots of the gene expression levels of DUOX2 and APOA1 between the CD and non-IBD patients (use the ```boxplot``` function).
