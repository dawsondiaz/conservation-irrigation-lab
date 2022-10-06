# Given a dataset, this code will allow you to take a random sample, then remove that sample from the original dataset for validation.

# Read data into R.
regression_data <- read_csv("YOURDATA.csv")

# Add IDs to each row of data, requires knowledge of how many rows of data there are. Set '1000' to however many rows of data you have.
regression_data <- regression_data %>%
  add_column("ID" = 1:1000, .before = "YOURFIRSTCOLUMN")

# Take a random sample of data points. This is up to your discretion. In this example it is 20%.
regression_val <- regression_data[sample(nrow(regression_data), 200),]

# Get all the IDs of rows selected for validation.
removeID <- as.character(regression_val$ID)

# Remove all of the IDs selected for validation from the original dataset.
'%notin%' <- Negate('%in%')
regression_cal <- regression_data %>%
  filter(ID %notin% removeID)

# Save sets of calibration and validation data.
write.csv(regression_cal, file="regression_cal.csv")
write.csv(regression_val, file="regression_val.csv")
