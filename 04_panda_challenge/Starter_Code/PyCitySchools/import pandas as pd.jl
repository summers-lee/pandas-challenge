import pandas as pd
from pathlib import Path

# File to Load (Remember to Change These)
school_data_to_load = Path("Resources/schools_complete.csv")
student_data_to_load = Path("Resources/students_complete.csv")

# Read School and Student Data File and store into Pandas DataFrames
school_data = pd.read_csv(school_data_to_load)
student_data = pd.read_csv(student_data_to_load)

# Combine the data into a single dataset.  
school_data_complete = pd.merge(student_data, school_data, how="left", on=["school_name", "school_name"])
school_data_complete.head()

# Calculate the total number of unique schools
school_name = schools_data_complete['school_name'].unique()
school_count = len(school_name)
school_count

# Calculate the total number of students
student_count = students_data_complete['student_name'].unique()
student_count

# Calculate the total budget
total_budget = school_data["budget"].sum()
total_budget


# Calculate the average (mean) math score
average_math_score = school_data_complete["math_score"].mean()
average_math_score

# Calculate the average (mean) reading score
average_reading_score = school_data_complete['reading_scores'].mean()
average_reading_score

# Use the following to calculate the percentage of students who passed math (math scores greather than or equal to 70)
passing_math_count = school_data_complete[(school_data_complete["math_score"] >= 70)].count()["student_name"]
passing_math_student_count = passing_math_count["Student ID"].count()
passing_math_percentage = passing_math_count / float(student_count) * 100
passing_math_percentage

# Calculate the percentage of students who passed reading (hint: look at how the math percentage was calculated)  
passing_reading_count = school_data_complete[(school_data_complete["math_score"] >= 70)].count()["student_name"]
passing_reading_student_count = passing_reading_count["Student ID"].count()
passing_reading_percentage = passing_reading_count / float(student_count) * 100
passing_reading_percentage

# Use the following to calculate the percentage of students that passed math and reading
passing_math_reading_count = school_data_complete[
    (school_data_complete["math_score"] >= 70) & (school_data_complete["reading_score"] >= 70)
].count()["student_name"]
overall_passing_rate = passing_math_reading_count /  float(student_count) * 100
overall_passing_rate

# Create a high-level snapshot of the district's key metrics in a DataFrame
district_summary = pd.DataFrame({
    "Total Schools": total_school_number,
    "Total Students": f"{total_students_number:,}",
    "Total Budget": f"${total_budget:,.2f}",
    "Average Math Score": f"{average_math_score:.6f}",
    "Average Reading Score": f"{average_reading_score:.5f}",
    "% Passing Math": f"{percent_passing_math:.6f}",
    "% Passing Reading": f"{percent_passing_reading:.6f}",
    "% Overall Passing": f"{Overall_passing: .6f}"
    }, index=[0])

# Formatting
district_summary["Total Students"] = district_summary["Total Students"].map("{:,}".format)
district_summary["Total Budget"] = district_summary["Total Budget"].map("${:,.2f}".format)

# Display the DataFrame
district_summary