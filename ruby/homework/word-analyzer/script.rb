# Array of words to analyze
    words_to_analyze = ["level", "elephant", "ruby", "book", "hello"]
=begin
    These are the words that will 
    be iterated through and analyzed.
=end


# Analyze each word in the array
for word in words_to_analyze
=begin
   For every word in the the array, "words_to_analyze", 
   this program will check for the following:
=end


# Is the word a palindrome?
    is_palindrome = word == word.reverse
=begin
If the word is a Palindrome, then the word is equal to
itself in reverse.
=end

# Does the word contain the letter 'e'?
    yes_e = word.include?("e")
=begin
    Checking to see if .include?("e")
    is true or false.
=end

# How many characters in this word?
    character_count = word.length


# Is the word ruby? Change it!
    ruby_replace = word.gsub(/ruby/i, "Python")
=begin
    Looking for the word 'ruby', in order to
    replace it with Python.
=end

# Output the results for each word
    puts "Word: #{word}"
    puts "Palindrome: #{is_palindrome}"
    puts "Contains 'e': #{yes_e}"
    puts "Character count: #{character_count}"
    puts "After Replacement: #{ruby_replace}"
    puts
    puts
end

=begin
    Each word is anylyzed and the results 
    are displayed. There's two extra "puts" with
    nothing afterwards in order to put some space
    between the data of each word for better
    visibility.
=end
