# U2.W4: Separate Numbers with Commas


# I worked on this challenge [by myself].

# 2. Pseudocode
# define a method name separate_comma that takes an integer as parameter
# create a while loop that loop depending on the size of the integer
# inside block fill a new array with 3 poped values followed by a comma
# the method should output a string with digits and appropriate number of commas
# if number of commas is 0 return number 


# 3. Initial Solution

# def separate_comma(num)
#   num_ary = num.to_s.scan(/./)
#   num_commas = (num_ary.size - 1) / 3
#   num_final_ary = []
  
#   if num_commas > 0
#     while num_ary.any? do
#       3.times { num_final_ary.unshift(num_ary.pop) if num_ary.size != 0 }
#       num_final_ary.unshift(',') if num_ary.size != 0
#     end
#     return num_final_ary.join 
#   else
#     return num.to_s
#   end
# end

 
# 4. Refactored Solution

def separate_comma(num)
  num_ary = num.to_s.scan(/./)
  num_commas = (num_ary.size - 1) / 3
  num_final_ary = []
  
  if num_commas > 0
    while num_ary.any? do
      3.times { num_final_ary.unshift(num_ary.pop) if num_ary.any? }
      num_final_ary.unshift(',') if num_ary.any?
    end
    num_final_ary.join
  else
    num.to_s
  end
end




# 5. Reflection 
# one of the challenging part about this exercise was not being able to use 
# regular expression. I created an array containing all the numbers and 
# transferred the elements into another array with commas after every 
# third element. Other problem was not knowing how to divide each element 
# in the string and assign each digit to appropriate indices. I found out 
# about String#scan method and passed in . to convert it to array format that
# I wanted. Also num_ary.any? statement seem repetitive inside while loop but
# could not find a way to refactor them at the moment.


