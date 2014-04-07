# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# create class called GuessingGame
# when it is initialized it should take an integer as a argument and give variable called 'answer'
# answer should be stored in instance variable @answer
# Define an instance method GuessingGame#guess which takes an integer called guess as its input. 
# guess should return the symbol
# :high if the guess is larger than the answer, 
# :correct if the guess is equal to the answer, and 
# :low if the guess is lower than the answer.
# Define an instance method GuessingGame#solved?
# which returns true if the most recent guess was 
# correct and false otherwise.


# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer 
#   end
  
#   def guess(guess)
#     if guess == @answer 
#       @last_guess = :correct 
#     elsif guess > @answer 
#       @last_guess = :high 
#     elsif guess < @answer 
#       @last_guess = :low 
#     end 
#   end

#   def solved? 
#     if @last_guess == :correct 
#       true 
#     else 
#       false 
#     end
#   end

# end




# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer 
  end
  
  def guess(guess)
    @last_guess = if guess == @answer 
                    :correct 
                  elsif guess > @answer 
                    :high 
                  elsif guess < @answer 
                    :low 
                  end 
  end

  def solved? 
    return true if @last_guess == :correct 
    false 
  end

end




# 1. DRIVER TESTS GO BELOW THIS LINE
puts GuessingGame.new(5).guess(4)  == :low 
puts GuessingGame.new(5).guess(10) == :high 
puts GuessingGame.new(5).guess(5)  == :correct 



# 5. Reflection 

# Using if..else statements for this exercise made it straightforward. Also realized that the case
# statement cannot be used in the situations where greater or less than sign is involved. I realized
# instance variable last_guess was being repeated too last times in initial solution so I set the 
# entire if..else statements to @last_guess. I also looked up symbols and its advantages over 
# strings from http://www.reactive.io/tips/2009/01/11/the-difference-between-ruby-symbols-and-strings/
