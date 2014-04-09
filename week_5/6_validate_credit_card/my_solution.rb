# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself].

# 2. Pseudocode
# create a class CreditCard 
#   create initialize method that takes integer as parameter
#     if integer is 16 digits long set it instance variable cc_number
#     else throw an ArgumentError
#   create instance method named double that takes no arguments
#     convert cc_num into an array each character occupying each index
#     iterate through an array and only pick negative even indices and double them
#     return transformed array   
#   create instance method named wierd_sum that takes an array from the wierd_double method and 
#    divides double digits into two separate characters and flatten. 
#    then use reduce method to add all the elements and return integer
# create check_card method that returns true when the returned sum from wierd_sum
#    is divisible by 10 and false otherwise 


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
# class CreditCard
#   def initialize(cc_num)
#     raise ArgumentError.new("credit card number must be 16 digits long") if cc_num.to_s.size != 16
#     @cc_num = cc_num  
#   end

#   def wierd_double
#     cc_ary = @cc_num.to_s.scan(/./).map{|x|x.to_i}
#     num_change = cc_ary.size / 2
#     for i in (1..num_change)
#       cc_ary[(0-i)*2] = cc_ary[(0-i)*2] * 2 
#     end
#     cc_ary
#   end

#   def wierd_sum
#     wierd_double.map!{|x|x.to_s.scan(/./)}.flatten!.map!{|x|x.to_i}.reduce(:+)
#   end

#   def check_card
#     wierd_sum % 10 == 0 ? true : false 
#   end
# end


# 4. Refactored Solution

class CreditCard
  def initialize(cc_num)
    raise ArgumentError.new("credit card number must be 16 digits long") if cc_num.to_s.size != 16
    @cc_num = cc_num  
  end

  def wierd_double
    cc_ary = @cc_num.to_s.scan(/./).map(&:to_i)
    for i in (1..(cc_ary.size/2))
      cc_ary[(0-i)*2] = cc_ary[(0-i)*2] * 2 
    end
    cc_ary
  end

  def wierd_sum
    wierd_double.map{|x|x.to_s.scan(/./)}.flatten.map(&:to_i).reduce(:+)
  end

  def check_card
    wierd_sum % 10 == 0 
  end
end





# 1. DRIVER TESTS GO BELOW THIS LINE

puts CreditCard.method_defined?(:wierd_double)
puts CreditCard.method_defined?(:wierd_sum)
begin 
  CreditCard.new(12345678910)
rescue ArgumentError
  puts true
end




# 5. Reflection 

# This time when I pseudo coded I translated my thoughts into pseudo code line by line instead of writing 
# one line for a block of code which is what I normally do. It was difficult to be too specific but it worked 
# out for the better overall. Also dividing each tasks in different methods and calling method within each 
# other made the code more readable. I found later also it helped with refactoring since I could keep some
# methods the same while working on the others. I practiced to_sym method to refactor and make the code 
# cleaner. Also got rid of some unnecessary variables to better performace.

