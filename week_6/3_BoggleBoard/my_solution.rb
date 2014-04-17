# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [with: Adam Dziuk].


# 2. Pseudocode
#psudocode for print_all 
#define a method name print_all
#  find total row of the two dimentional array 
#    iterate through each row join and display
#  same for column 
#pseudo code for get_diagonal
# form a row array and columns array usings ranges
# use zip method to paid them according to index
# run the array through find_word method that finds letters for corresponding coordinates


# 3. Initial Solution
# class BoggleBoard
#   def initialize(dice_grid)
#     @dice_grid = dice_grid
#   end

#   def create_word(*coords)
#     coords.map { |coord| @dice_grid[coord.first][coord.last]}.join("")
#   end

#   def get_row(row)
#     @dice_grid[row]
#   end
    
#   def get_col(col)
#     @dice_grid.map{|row| row[col]}
#   end

#   def print_all  #prints all the rows and columns as 8 four-letter strings    
#     row_total = @dice_grid.size
#     col_total = @dice_grid.first.size 
#     for i in (0..row_total-1)
#       puts get_row(i).join
#     end
#     for i in (0..col_total-1)
#       puts get_col(i).join
#     end
#   end
  
 
#   def find_word(coord)
#     @dice_grid[coord.first][coord.last]
#   end

#   def get_diagonal(start,last)
#     raise ArgumentError.new("Must be a diagonal") unless (start.first-last.first).abs == (start.last-last.last).abs

#     x_arr = if last.first > start.first 
#                  (start.first..last.first)
#             else 
#                  (start.first).downto(last.first)
#     end  

#     y_arr = if start.last > last.last 
#               (start.last).downto(last.last)
#             else 
#               (start.last..last.last)
#     end

#     final = []
#     temp = x_arr.zip(y_arr)
#     temp.each do |coord|
#     final << find_word(coord)
#     end
#     final
#   end

# end
 

# 4. Refactored Solution
class BoggleBoard
  def initialize(dice_grid)
    @dice_grid = dice_grid
  end

  def create_word(*coords)
    coords.map { |coord| @dice_grid[coord.first][coord.last]}.join("")
  end

  def get_row(row)
    @dice_grid[row]
  end
    
  def get_col(col)
    @dice_grid.map{|row| row[col]}
  end

  def print_all  #prints all the rows and columns as 8 four-letter strings    
    row_total = @dice_grid.size
    col_total = @dice_grid.first.size 
    for i in (0..row_total-1)
      puts get_row(i).join
    end
    for i in (0..col_total-1)
      puts get_col(i).join
    end
  end
  
 
  def find_word(coord)
    @dice_grid[coord.first][coord.last]
  end

  def get_diagonal(start,last)
    raise ArgumentError.new("Must be a diagonal") unless (start.first-last.first).abs == (start.last-last.last).abs

    x_arr = if last.first > start.first 
                 (start.first..last.first)
            else 
                 (start.first).downto(last.first)
    end  

    y_arr = if start.last > last.last 
              (start.last).downto(last.last)
            else 
              (start.last..last.last)
    end

    final = []
    temp = x_arr.zip(y_arr)
    temp.each do |coord|
    final << find_word(coord)
    end
    final
  end

end




 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]

boggle_board = BoggleBoard.new(dice_grid)
# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
def assert 
  raise "Assert Failed!" unless yield 
end
assert{boggle_board.create_word([2,1],[3,1],[3,2],[3,3]) == "cake"}
assert{boggle_board.get_row(3) == ["t", "a", "k", "e"]}
assert{boggle_board.get_col(1) == ["r", "o", "c", "a"]}
assert{boggle_board.get_diagonal([0,0],[3,3]) == ["b","o","l","e"]}
assert{boggle_board.get_diagonal([3,3],[0,0]) == ["e","l","o","b"]}


# 5. Reflection 

# This exercise was an extension of our boggle board exercise from the previous week. 
# I learned how to use splat operator which is very useful in making our
# parameters more flexible. In #create_word *coords allows us to inserts infinite
# number of coordinates to make up words. Although not required from the directions,
# I created print_all method to print out all the get_col and get_row in our grid.
# It was a good practice in embedding other instance methods shared in BoggleBoard 
# class. Real challenge of this exercise was in Bonus section. I managed to figure 
# out ways to get diagonal values going from top left corner to bottom right but 
# not vice versa until I found out about the downto method to bypass the problem! 