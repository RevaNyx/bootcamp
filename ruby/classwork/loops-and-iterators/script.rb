#1.
=begin
Set the value of the variable num to 1.
While the variable num is less than or equal to 20, increment by one. 
If the value of num is even, print 'Even. ' Otherwise print 'Odd. '
=end
num = 1
while num <= 20
    num = num + 1
    if num.even?
        print 'Even. '
    else
        print 'Odd. '
    end
end

#2.
=begin
Set the value of the variable num to 1. 
From values 1-20, if num is even, print 'Even. '. 
Otherwise print 'Odd. '
=end
num = 1
for num in 1..20
    if num.even?
        print 'Even. '
    else
        print 'Odd. '
    end
end