=begin
    Peter and Tamir
=end

# Set two variables, a and b. Give them numeric values
a = 1015
b = 226

#1. If a is greater than b then print "a is bigger than b"
if a > b 
    print 'a is bigger than b'
elsif b < a # else if b is less than a then print "b is less than a"
    print 'b is less than a'
else # if the first two conditions are not true then print a and b are equal
    print 'a and b are equal'
end

#2. Print excercise unless you are not tired.
tired = false
    print "Don't excercise!" unless tired

#3
    # test_1 should be false (15 greater than 45)
test_1 = 15 > 45

    # test_2 = should be false (100 is equal to 25)
test_2 = 100 == 25

    # test_3 = should be true (75 is not equal to 63)
test_3 = 75 != 63

#4. 
# test_1 should be true (12 is equal to 12, and 100 is greater than 25)
test_1 = 12 == 12 && 100 > 25

# test_2 = should be true (25 is not equal to 25 OR 40 is not equal to 12)
test_2 = 25 != 25 || 40 != 12

# test_3 = should be false (not true/false  and true/false )
test_3 = !(true && false) && (true && false)
