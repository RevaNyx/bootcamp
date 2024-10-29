#1.
=begin
Set the value of the variable num to 1.
While the variable num is less than or equal to 20.. 
If the value of num is even, print 'Even. ' Otherwise print 'Odd. '
Increment by one.
=end
num = 1
while num <= 20
    
    if num.even?
        print "#{num} Even. "
    else
        print "#{num} Odd. "
    end
    num = num + 1
end

#2.
=begin
Set the value of the variable num to 1. 
For num values 1-20, if num is even, print 'Even. '. 
Otherwise print 'Odd. '
=end
num = 1
for num in 1..20
    if num.even?
        print "#{num} Even. "
    else
        print "#{num} Odd. "
    end
end