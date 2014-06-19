library(plyr)

#########################################################
### (i) Prepare "Subject" Column with col name "Subject"
#########################################################

# Combine train and test set

raw_subject_train <- read.table("./train/subject_train.txt")
colnames(raw_subject_train) <- "Subject"

raw_subject_test <- read.table("./test/subject_test.txt")
colnames(raw_subject_test) <- "Subject"


comb_subject <- rbind(raw_subject_train, raw_subject_test)

##############################################################
## (ii) Prepare "Activities" Column with col name "Activities"
##############################################################

# Combine train and test set
raw_y_train <- read.table("./train/y_train.txt")
colnames(raw_y_train) <- "Activities"

raw_y_test <- read.table("./test/y_test.txt")
colnames(raw_y_test) <- "Activities"

comb_y <- rbind(raw_y_train, raw_y_test)

# To use descriptive activity names to name the activities in the data set
comb_y_factor <- factor(comb_y$Activities)

activities_labels <- read.table("activity_labels.txt")

activities_labels_factor <- factor(activities_labels$V2)
# Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

activities_labels_factor <- factor(activities_labels_factor,levels(activities_labels_factor)[c(4,6,5,2,3,1)])
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

Activities <- mapvalues(comb_y_factor, from = levels(comb_y_factor), to = levels(activities_labels_factor))


##############################################################
## (iii) Prepare "Features" Columns with only mean() or std() columns
##############################################################

# Obtain names of features
raw_feature_names <- read.table("features.txt")

# Find the columns with mean or std in the feature names
mean_std_cols <- grep('mean|std', raw_feature_names[,2])

# Take subset of the mean and std columns of training and test data
# Label the columns
# and combine the training and test data

raw_X_train <- read.table("./train/X_train.txt")
reduced_X_train <- raw_X_train[,mean_std_cols]
colnames(reduced_X_train) <- raw_feature_names[mean_std_cols,2]

raw_X_test <- read.table("./test/X_test.txt")
reduced_X_test <- raw_X_test[,mean_std_cols]
colnames(reduced_X_test) <- raw_feature_names[mean_std_cols,2]

comb_features <- rbind(reduced_X_train, reduced_X_test)

##############################################################
## (iv) Combine subject + activities + features
##############################################################


df_comb <- cbind(comb_subject, Activities, comb_features)
write.table(df_comb, file = "part1_df.txt", col.names = NA, quote = FALSE, sep = "\t\t")

# Read back to verify
df_comb2 <- read.table("part1_df.txt") 

# To group and order the activities together
ordered_df <- df_comb[order(df_comb[,"Subject"], df_comb[,"Activities"]),]
write.table(ordered_df, file = "part1_ordered_df.txt", col.names = NA, quote = FALSE, sep="\t\t\t\t")


##############################################################
## (v) Compute Average by Subject by Activities
##############################################################

result <- aggregate(df_comb[,3:NCOL(df_comb)], by=list(df_comb[,1], df_comb[,2]), FUN=mean)

# Label the columns by prepending "Avg" to denote average
colnames(result) <- paste("Avg", colnames(result), sep = "_")
colnames(result)[1] <- "Subject"
colnames(result)[2] <- "Activities"

#Write to file
write.table(result, file = "result.txt", col.names = NA, quote = FALSE, sep = "\t\t")

