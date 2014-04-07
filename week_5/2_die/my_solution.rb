# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode
# create class named 'Die'
# create initialize method that takes array of lables 
#   each element in an array represent the face value of each side of a die 
# create method sides that returns a integer indicating number of sides on a die
# create method roll that returns random element on an Array representing 
#    a value that shows on a face of a die when rolled 



# 3. Initial Solution

class Die
  def initialize(labels)
  	raise ArgumentError.new "there must be list of labels" if labels.empty?
    @labels = labels 
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels[rand(sides)]
  end
end



# 4. Refactored Solution

# I couldn't find any ways to refactor this solution further 


# 1. DRIVER TESTS GO BELOW THIS LINE

puts Die.new(['A','B','C','D']).sides == 4
puts ['A','B','C','D'].include?(Die.new(['A','B','C','D']).roll)
begin 
  Die.new([])
rescue ArgumentError
  puts true 
end

# 5. Reflection 

# I followed similar steps to approaching this problem as the previous exercise. Instead of passing in 
# number of sides in new method this class took array of labels. I added length method and called 
# sides method inside of roll method to get the correct return value. I learned that you can pass in 
# type of error after rescue statement to specify type of error it is going to rescue. Line 46 would only
# save ArgumentErrors and in case of other errors it would display the message in console. 

