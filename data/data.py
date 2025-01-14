import pandas as pd


# Read the CSV file
file_path = "data/us/test.csv"  # Replace with your file path
df = pd.read_csv(file_path)

# Keep only the 'date' and 'Solar Power Output' columns
df_filtered = df[['date', 'Solar Power Output']]

# Save the filtered data to a new CSV file
output_path = "data/us_without_weather/test.csv"  # Replace with your desired output file name
df_filtered.to_csv(output_path, index=False)

print("Filtered data saved to", output_path)
