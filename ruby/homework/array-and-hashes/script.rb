# Create an array of fruits
fruits = ["apple", "banana", "cherry", "date", "fig", "grape"]

# List each fruit in the array

puts " Fruits: #{fruits}"

puts # Blank line for readability

# List the first and last fruits in the array
puts "FIRST FRUIT: #{fruits.first}"       # Access the first fruit at index 0
puts "LAST FRUIT: #{fruits.last}"       # Access the last fruit using -1
puts

# Add a new fruit, kiwi
fruits << "kiwi"                       

# Remove a fruit (cherry) from the array
fruits.delete("cherry")                

# Display the updated list of fruits
puts "Updated list of fruits: #{fruits.join(', ')}" # Joins fruits into a string with commas for clarity
puts

# Check if the array contains "apple"
if fruits.include?("apple")            
  puts "The fruit 'apple' exists in the array."
end

# Calculate the total number of fruits
total_fruits = fruits.length          
puts "TOTAL NUMBER OF FRUITS: #{total_fruits}"
puts

# STRETCH GOAL

# Ask the user to input a new fruit
puts "Please enter a fruit: "
fruit_input = gets.chomp.downcase      # Receives input from the user and downcases it

# Check if the input fruit is already in the array


puts "Is 'apple' in the array? #{fruits.include?('apple')}"
# Sort the fruits array in alphabetical order
sorted_fruits = fruits.sort            

# Print the sorted fruits array
puts "Sorted fruits: #{sorted_fruits.join(', ')}"
puts

# Create a hash for a student with initial data
student = { "name" => "John Smith", "age" => 25, "major" => "Computer Science" }

# Iterate through each key-value pair in the student hash
student.each do |key, value|
  # Print the key and value for each attribute in the hash
  puts "#{key}: #{value}"
end
puts

# Print only the value associated with the "name" key
puts "Student Name: #{student["name"]}"
puts

# Add a new key-value pair for GPA and update age
student["gpa"] = 3.7                  # Adds a new key "gpa" with value 3.7
student["age"] = 26                   # Updates the "age" value to 26
puts

# Print the updated hash values
student.each do |key, value|
  puts "#{key}: #{value}"
end
puts

# Check if the key "gender" exists in the student hash
if student.key?("gender")             
  puts "The key 'gender' exists in the hash."
else
  puts "The key 'gender' does not exist in the hash."
end
puts

#STRETCH GOAL

# Create an array of student hashes
students = [
  { name: "Tamir Harris", major: "Web Development" },
  { name: "Deirdre Witcher", major: "Chemistry" },
  { name: "John Torga", major: "Real Estate" },
  { name: "James Tree", major: "Art" }
]

# Iterate through each student in the array and print their name and major
students.each do |student|
  puts "Name: #{student[:name]}, Major: #{student[:major]}" # Accesses each hash's :name and :major
end