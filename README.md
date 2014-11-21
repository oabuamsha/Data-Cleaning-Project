Data-Cleaning-Project-John Hopkins University
=====================

We start by Reading and Decoding the activities in order to include the description later while creating the tidy dataset 

Then, we read the three files needed to put together the subject, the activity and the features for both the test and the train data
Once the train and the test datatset are properly created, we simply bind them together.

We then traverse the feature list to select the needed (mean, std) features, we keep the feature names for our new datasete except that we omit the paraentehsis.
After the feature selection is made, we create the  'sub'dataset and we save the feature names as the code book.

We finally Split the data according to subjects and activities and apply colMeans on each parts of the splitted data.
We use sapply, so we obtain a matrix with ligns being the averages and columns being the subject X activity couples, so we transpose the matrix and save it to file.


