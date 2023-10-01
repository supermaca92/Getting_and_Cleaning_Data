##CODEBOOK

This codebook highlights the information that is contained within the run_analysis.R code and what the data contains within it. 

## DATA SUMMARY

The data was produced by the Center for Machine Learning and Intelligent Systems, and was carried out using a group of 30 volunteers. This group was within a chosen bracket and this was 19-48 years old, and each of them preformed a number of activities (shown under Identifiers heading) while wearing the same brand of smartphone; in this case a Samsung Galaxy S II.

An accelerometer and a gyroscope was used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz, which is how the data used within this code was produced. Furthermore a video-recording was also taken to confirm the results of the accelerometer and gyroscope, and if neccessary, add manual data to the data set.

## DATA SET INFORMATION

1. Identifiers
   - subjet
   - activity
2. Measurements
3. Variables
   - Train data set --> contain the data relating to the training sessions
   - Test data set --> contains the data relating to the test sessions
   - features --> contains the downloaded features.txt file
   - activityLabels --> contain the downloaded activitylabels text file
   - featuresName --> contains a numeric vector that is used within the code to extract the desired data set
   - featuresNamed --> as before but more human readable
   - finalData --> contains the trainingData and testData
   - meltedData --> contains the final data with the melt function applied
   - meanData --> contains the final data with the mean function applied



