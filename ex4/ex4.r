set.seed(1907)

sample <- rexp(2918, rate = 25)

# Calculate the successive sum
successive_sum <- cumsum(sample)

# Find the instant of occurrence of the last event
T <- ceiling(successive_sum[2908])

# Create a vector of subinterval endpoints
subinterval_endpoints <- seq(1, T, by = 1)

# Count the number of events in each subinterval
events_per_subinterval <- tabulate(cut(successive_sum, breaks = subinterval_endpoints))

# Calculate the average number of events per subinterval
average_events_per_subinterval <- mean(events_per_subinterval)

# Calculate the expected value of the number of events in a subinterval
expected_events_per_subinterval <- length(sample) / T

# Calculate the absolute deviation
absolute_deviation <- abs(average_events_per_subinterval - expected_events_per_subinterval)

# Round the deviation to 4 decimal places
rounded_deviation <- round(absolute_deviation, 4)

# R: 0,0867
