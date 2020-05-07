## Introductory Linux Assignment



### Problem 0: Acquiring data and decompressing a folder.
- Download data from XXXXXX.
- Decompress with XXXXXX.
- Enter this directory with "cd".

### Problem 1: Making directories and copying files
- Make a new directory
- Copy all files containing "copy_me" in the filename from the folder "test_files/problem1" to your new folder
- Compress this new folder that you've created and filled with files. It's more convenient to compress folders when sending files to someone else.

### Problem 2: Running a pre-existing program and modifying the output
- Run provided Python script and write both standard output and standard error to separate files.
- Look at each file with the "less" command
- Concatenate separate header to output table

### Problem 3: Parsing plain-text files
- Parse out headerlines and sequences that match a particular subsequence from 10 FASTAs.
- Count how many sequences contain the subsequence.
- Replace all instances of U in each sequence with T (Note: you will need to make sure that any U characters in headerlines are not replaced).

### Problem 4: Parse and manipulate header of large compressed table
- Parse out just the first line of the table (the headerline), remember to use zcat.
- Split each "field" (i.e., everything split by the delimiter, which is tabs in this case).
- Write out the header to a new file with each field written to a different line.

### Problem 5: Bash for loop
- Make a new output folder
- Loop over every line in the above file
- For every loop of the above file copy the original table to the folder as a new file called "$SAMPLE_copy.tsv.gz"
- Tar compress and gzip this folder.
