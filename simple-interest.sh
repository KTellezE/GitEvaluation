#!/bin/bash

# Simple Interest Calculator

# Function to validate if the input is a number and greater than zero
validate_input() {
    local input=$1
    if [[ ! $input =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $input == 0 ]]; then
        echo "Invalid input: $input. Please enter a number greater than zero."
        exit 1
    fi
}

echo "Welcome to the Simple Interest Calculator"

# Read principal amount
read -p "Enter principal amount: " principal
validate_input $principal

# Read rate of interest
read -p "Enter rate of interest (in %): " rate
validate_input $rate

# Read time period
read -p "Enter time period (in years): " time
validate_input $time

# Calculate simple interest
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Display the result
echo "The simple interest is: \$${interest}"

# Optionally, save the result to a file
read -p "Do you want to save the result to a file? (y/n): " save_to_file
if [[ $save_to_file =~ ^[Yy]$ ]]; then
    output_file="simple_interest_result.txt"
    echo "Principal: \$${principal}" > $output_file
    echo "Rate of Interest: ${rate}%" >> $output_file
    echo "Time Period: ${time} years" >> $output_file
    echo "Simple Interest: \$${interest}" >> $output_file
    echo "Result saved to $output_file"
fi
