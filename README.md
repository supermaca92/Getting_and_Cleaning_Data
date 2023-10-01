# Getting_and_Cleaning_Data
WEEK 4 PROJECT 

# SYNOPSIS

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

# REVIEW CRITERIA

1. The submitted data set is tidy. 
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

# TASKS

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# REPOSITORY CONTENT 

This repository includes 4 files, the R script named run_analysis.R, this read_me file you’re reading now, the codebook file which explains more about the data set and the methodology, and the final tidy data set.

| Goal | Item | 
|------|------|
| RScript | run_analysis.R |
| Read_me file | README.md|
| CodeBook file | CodeBook.md|
| Tidy Data file | Clean Data Set |


# CODE EXPLANATIONS

The data for this project was downloaded on 01/02/2023 and copies to the working directory into a director called "data" with subdirectories "data\test" and "data\train" similar to the original structure in the downloaded zip file.
The code for this analysis is located in the run_analysis.R file within this repository.
The function that will do the analysis is called proces_data()

About the code:

1. All the files are read into objects
2. The raw data from the training and test data sets are combined using rbind
3. The column names for the datarame are added as columns of the dataframe
4. The labels of the activities are added by merging the activity labels with the dataframe

At this point --> all the data resides into one big data frame. 

5. All the measurements containing standard deviation 9std) and the mean values are identified using grep on the column names. Only these columns will be selected for future analysis.
6. Using the melt function from the reshape2 library the data is converted to the long form using the subject and activity as ID values.
7. Using the dcode function the data is written back to the wide format contaiing only the mean value for all the variables selected per subject per activity.
8. The resulting data is written in a txt file called result.txt

The data in the result.txt file is organised as follows:

- The first column contains the subject ID and the second column contains the description of the activity when the measurements where taken.
- The rest 79 columns contain the mean for each original variable that contianed either the mean or standard deviation for that measurement.
- The column names describe the different values contained.


# REFERENCES

- Thoughtfulbloke
- Benthecoder
- Meltin & Casting (A Language, not a Letter: Learning Statisting in R)
