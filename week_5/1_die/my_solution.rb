# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode
# create a class named 'Die'
# create initialize method that takes integer as total number of sides for instance variable
# if the user passes in a integer less than 0 activate an error msg
# create instance method sides that returns integer representing total number of sides 
# create instance method roll that returns a random integer between 1 and number of sides to indicate
# 	the side that is facing up from the result of a roll 



# 3. Initial Solution

# class Die
#   def initialize(sides)
#     @sides = sides
#     raise ArgumentError.new("sides have to be greater than zero") if sides < 1 
#   end
  
#   def sides
#     @sides
#   end
  
#   def roll
#     rand(@sides) + 1
#   end
# end



# 4. Refactored Solution

class Die
  attr_reader :sides

  def initialize(sides)
    @sides = sides
    raise ArgumentError.new("sides have to be greater than zero") if sides < 1 
  end

  def roll
    rand(@sides) + 1
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

puts Die.new(10).sides == 10
puts (1..6).include?Die.new(6).roll
begin 
  Die.new(0)
rescue 
  puts true 
end



# 5. Reflection 

# Being such simple exercise, I didn’t use any particular strategy in solving the problem. I wrote out
# all the code first except for the error part which needed more researching before I could start
# using them.  Only refactored codes were short handing ‘sides’ method with attr_reader. 
# This exercise gave me a chance to refresh my memory on making our own classes.
# http://rubylearning.com/satishtalim/ruby_exceptions.html was a helpful website in
# researching about rescue raise begin and end.