---
# Codebook for Getting and Cleaning Data Final Project
output: html_document
---

The data set that this codebook pertains to is located in the tidy_data.txt file of this repository.

## Data

The tidy_data.txt data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.

## Variables

### Identifiers:

#### Subject 
(Subject identifier, integer, ranges from 1 to 30).

#### Activity 
(Activity identifier, string with 6 possible values):

* WALKING: subject was walking
* WALKING_UPSTAIRS: subject was walking upstairs
* WALKING_DOWNSTAIRS: subject was walking downstairs
* SITTING: subject was sitting
* STANDING: subject was standing
* LAYING: subject was laying

### Average of measurements:

The measurements are classified in two domains:

#### Time-domain signals:

* timeDomainBodyAccelerometerMeanX
* timeDomainBodyAccelerometerMeanY
* timeDomainBodyAccelerometerMeanZ
* timeDomainBodyAccelerometerStandardDeviationX
* timeDomainBodyAccelerometerStandardDeviationY
* timeDomainBodyAccelerometerStandardDeviationZ
* timeDomainGravityAccelerometerMeanX
* timeDomainGravityAccelerometerMeanY
* timeDomainGravityAccelerometerMeanZ
* timeDomainGravityAccelerometerStandardDeviationX
* timeDomainGravityAccelerometerStandardDeviationY
* timeDomainGravityAccelerometerStandardDeviationZ
* timeDomainBodyAccelerometerJerkMeanX
* timeDomainBodyAccelerometerJerkMeanY
* timeDomainBodyAccelerometerJerkMeanZ
* timeDomainBodyAccelerometerJerkStandardDeviationX
* timeDomainBodyAccelerometerJerkStandardDeviationY
* timeDomainBodyAccelerometerJerkStandardDeviationZ
* timeDomainBodyGyroscopeMeanX
* timeDomainBodyGyroscopeMeanY
* timeDomainBodyGyroscopeMeanZ
* timeDomainBodyGyroscopeStandardDeviationX
* timeDomainBodyGyroscopeStandardDeviationY
* timeDomainBodyGyroscopeStandardDeviationZ
* timeDomainBodyGyroscopeJerkMeanX
* timeDomainBodyGyroscopeJerkMeanY
* timeDomainBodyGyroscopeJerkMeanZ
* timeDomainBodyGyroscopeJerkStandardDeviationX
* timeDomainBodyGyroscopeJerkStandardDeviationY
* timeDomainBodyGyroscopeJerkStandardDeviationZ
* timeDomainBodyAccelerometerMagnitudeMean
* timeDomainBodyAccelerometerMagnitudeStandardDeviation
* timeDomainGravityAccelerometerMagnitudeMean
* timeDomainGravityAccelerometerMagnitudeStandardDeviation
* timeDomainBodyAccelerometerJerkMagnitudeMean
* timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
* timeDomainBodyGyroscopeMagnitudeMean
* timeDomainBodyGyroscopeMagnitudeStandardDeviation
* timeDomainBodyGyroscopeJerkMagnitudeMean
* timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation.

#### Frequency-domain signals:
* frequencyDomainBodyAccelerometerMeanX
* frequencyDomainBodyAccelerometerMeanY
* frequencyDomainBodyAccelerometerMeanZ
* frequencyDomainBodyAccelerometerStandardDeviationX
* frequencyDomainBodyAccelerometerStandardDeviationY
* frequencyDomainBodyAccelerometerStandardDeviationZ
* frequencyDomainBodyAccelerometerMeanFrequencyX
* frequencyDomainBodyAccelerometerMeanFrequencyY
* frequencyDomainBodyAccelerometerMeanFrequencyZ
* frequencyDomainBodyAccelerometerJerkMeanX
* frequencyDomainBodyAccelerometerJerkMeanY
* frequencyDomainBodyAccelerometerJerkMeanZ
* frequencyDomainBodyAccelerometerJerkStandardDeviationX
* frequencyDomainBodyAccelerometerJerkStandardDeviationY
* frequencyDomainBodyAccelerometerJerkStandardDeviationZ
* frequencyDomainBodyAccelerometerJerkMeanFrequencyX
* frequencyDomainBodyAccelerometerJerkMeanFrequencyY
* frequencyDomainBodyAccelerometerJerkMeanFrequencyZ
* frequencyDomainBodyGyroscopeMeanX
* frequencyDomainBodyGyroscopeMeanY
* frequencyDomainBodyGyroscopeMeanZ
* frequencyDomainBodyGyroscopeStandardDeviationX
* frequencyDomainBodyGyroscopeStandardDeviationY
* frequencyDomainBodyGyroscopeStandardDeviationZ
* frequencyDomainBodyGyroscopeMeanFrequencyX
* frequencyDomainBodyGyroscopeMeanFrequencyY
* frequencyDomainBodyGyroscopeMeanFrequencyZ
* frequencyDomainBodyAccelerometerMagnitudeMean
* frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerMagnitudeMeanFrequency
* frequencyDomainBodyAccelerometerJerkMagnitudeMean
* frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
* frequencyDomainBodyGyroscopeMagnitudeMean
* frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeMagnitudeMeanFrequency
* frequencyDomainBodyGyroscopeJerkMagnitudeMean
* frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

## Transformations

The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.

2. The measurements on the mean and standard deviation were extracted for each measurement, and the others were discarded.

3. The activity identifiers were replaced with descriptive activity names (see the Identifiers section).

4. The variable names were replaced with descriptive variable names:

* Special characters (i.e. (, ), and -) were removed
* The initial f and t were expanded to frequencyDomain and timeDomain.
* Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation.
* Replaced BodyBody with Body.

5. The final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions).

