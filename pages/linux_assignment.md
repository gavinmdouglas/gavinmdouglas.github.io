---
layout: page
title: Linux Intro Assignment
---

__Author:__ Gavin Douglas  
__First created:__ 10 May 2020
__Last updated:__ 10 May 2020 

It's typical to pick up Bash and Linux commands by googling issues as they arise rather than memorizing all commands. Over time your toolkit of familiar commands will gradually grow although you may need to continue googling to figure out the syntax you need exactly.

However, to grow your toolkit of commands you need to be exposed to different issues! To that end, the below problems are meant to push you to learn new introductory Bash skills, which hopefully will be a good complement to a standard Linux tutorial (such as [this one](http://korflab.ucdavis.edu/bootcamp.html)).

This assignment is meant to build on a simpler quiz I wrote previously, which you can find [here](https://github.com/LangilleLab/microbiome_helper/wiki/Introductory-Linux-Quiz). Unlike in that quiz, the expected code will not be provided for this assignment. However, the expected results for the key problems will be described so you can confirm your commands are working.


### Problem 0: Acquiring data and decompressing folder
* Download the data from [this link]({{ BASE_PATH }}/assets/data/linux_intro_assignment.tar.gz) with `wget` on the command-line.

* Decompress the directory with the the `tar` command (with the options `-xzf`).  

* Enter the directory `linux_intro_assignment` with `cd`.


### Problem 1: Making directories and copying files
* Make a new directory.  

* Copy all files containing `copy_me` in the filename from the folder `test_files/prob1_files` to your new folder.  

* There should be 67 files copied to the new folder, which you can see with by typing `ls -1`. How would you confirm that there are 67 files there 
with a Linux command? Hint: the command `wc -l` will tell you the number of lines in a file.

* Compress this new folder that you've created and filled with files. It's more convenient to compress folders when sending files to someone else.


### Problem 2: Running a pre-existing program and modifying the output
* Run the provided Python script `do_something.py` and write both standard output and standard error to separate files (Hint check out different output syntax like `>`).  

* Look at each file with the `less` command. The standard output will be a table and the standard error will just a few sentences.  

* Note that the table is missing column names. You can fix this by making a new file with a header. First, write out these columns separated by tabs to a new file: `sample    var1    var2    var3`. Now concatenate these files together to make a new file. The final table should look like this:

      sample    var1    var2    var3   
      ID241   0       20      11  
      ID1     99      42      2811   
      ID54    28      58      2  
      ID42    51      59      0  


### Problem 3: Parsing plain-text files
* There are ten FASTA files in `test_files/prob3_files`. Take a look at a few of these files. FASTA files contain biological sequences (protein, RNA, or DNA). Each line contains either a headerline (starting with `>` followed by the sequence name) or the actual sequence itself. In this case every second line is a sequence, but note that with actual FASTA files often the same sequences are split over numerous lines.  

* What could you run to confirm that there are 30 sequences in total across all files? (Hint: check out `cat` and `grep -c`)  

* What command(s) would help you confirm that 15 sequences across all FASTAs contain the subsequence `ACC`?  

* Make a new FASTA with only the sequences that contain `ACC` (Hint: check out the `grep` option `-B` to see how lines preceeding a match can also be printed). 

* How could you replace all instances of U in sequences in this subsetted FASTA with T (Hint: check out the `sed` command)?  


### Problem 4: Parse and manipulate header of large compressed table
* Take a look at the compressed table in `test_files/prob4_files/wide_table_ex.txt.gz`. Each column of this table is a different sample except for the first column, which breaks down what fictious variable each row corresponds to.  

*  Parse out just the first line of the table (i.e., the header-line). Note: you will need to decompress the file or use `zcat` to decompress the file to standard output.

* Figure out how to split the header-line by tab characters (which are the delimiters of this table) with `awk`.
* Write out the header to a new file with each delimited field written to a different line.  
  
* Based on this new table, confirm that there are 27 samples.  


### Problem 5: Bash for loop
* Make a new output folder.

* Loop over every sample name in the file you created in Problem 4 with a `for` loop (note that you should exclude the first column called `variable` somehow). To help, see the two hints below.
  
*Hint 1*: If you wanted to loop over and print the numbers 1 to 5 in Bash you could use this command: `for i in {1..5}; do echo $i; done`
  
*Hint 2*: To get a Bash array of all elements in a file that you could loop over you could use this syntax: `$( cat FILENAME )`
  
* For every loop of the above file copy the original table to the folder as a new file called "SAMPLE_copy.tsv.gz" (where SAMPLE corresponds to each different sample name).

* Tar compress and gzip this new folder.
