
# This is to detect and deal with outliers in the dataset

df <- read.csv(file.choose(), header = TRUE, sep = ',')

# detect outlier in c (response bias)

OutVals <- boxplot(df$c)$out
index <- which(df$c %in% OutVals)

# get the true index 

# new_index <- data.frame(matrix(ncol = 3, nrow = 0, dimnames = 
#                                  list(NULL, c("Sub_ID", "Session_ID", "Response_ID"))))
# 
# for (i in index) {
#   new_index[i, 1] <- df[i, 1]
#   new_index[i, 2] <- df[i, 3]
#   new_index[i, 3] <- df[i, 4]
# }
# 
# new_index <- na.omit(new_index)
# 
# write.table(new_index, file = "new_index.csv", sep = ",", col.names = TRUE,
#             row.names = FALSE, qmethod = "double")

outlier_values <- boxplot.stats(df$c)$out

outlier_values

# exclude those participants based on 
df <- df[!(df$c %in% outlier_values), ]

loc <- c(18:28)
df$loc <- rowSums(sapply(df[, loc], as.numeric))

write.table(df, file = "sdt_stats_Ctrl_ip_noip_outlier.csv", sep = ",", col.names = TRUE,
            row.names = FALSE, qmethod = "double")


##################################################################################

# Read the ID file

df_ID <- read.csv(file.choose(), header = TRUE, sep = ',')

# Read the 

df <- read.csv(file.choose(), header = TRUE, sep = ',')

attach(df)

df <- subset(df, df$Session_ID %in% df_ID$Session_ID)

write.table(df, file = "Demographics.csv", sep = ",", col.names = TRUE,
            row.names = FALSE, qmethod = "double")



