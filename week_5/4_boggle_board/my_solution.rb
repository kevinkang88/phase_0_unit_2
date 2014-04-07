# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [with: Adam Dziuk]

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]



# Pseudocode
# create a class called Boggle
# create initialize method with vairable called boggle_board which is an Array within an Array
# get_row:
# create method called get_row that takes one parameter called 'row' integer
# boggle_board and pass in 'row' as a index in between brackets
# get_col:
# create method called get_col that takes one parameter called 'col' integer
# iterate through instance variable boggle_board with Array#map method
# pass a block |x| with col being the index of x

# Initial Solution
# class Boggle
#   def initialize(boggle_board)
#     @boggle_board = boggle_board
#   end
  
#   def get_row(row)
#     @boggle_board[row]
#   end
    
#   def get_col(col)
#     @boggle_board.map{|x| x[col]}
#   end
# end


# Refactored Solution
# We thought that 'row' was a better variable name to use than 'x' within the get_col method because of better readability 
class Boggle
  def initialize(boggle_board)
    @boggle_board = boggle_board
  end
  
  def get_row(row)
    @boggle_board[row]
  end
    
  def get_col(col)
    @boggle_board.map{|row| row[col]}
  end
end



# DRIVER TESTS GO BELOW THIS LINE
puts Boggle.method_defined? :get_row
puts Boggle.method_defined? :get_col
puts Boggle.new(boggle_board).get_row(0) == ["b", "r", "a", "e"]
puts Boggle.new(boggle_board).get_col(0) == ["b", "i", "e", "t"] 

# Reflection 

# We took an approach to create a class named Boggle and insert instance methods inside. 
# This made it easy to integrate two questions and move away from using global variables.
# I learned Class#method_defined? from my partner which is a useful tool for checking
# if particular class is including a particular method.   