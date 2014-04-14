# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode
#psudocode for print_all 
#define a method name print_all
#  find total row of the two dimentional array 
#    iterate through each row join and display
#  same for column 


# 3. Initial Solution
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
  
  def diagonal(start_coord,end_coord)
    raise "Coordinates are not diagonal to each other!" unless (end_coord.last - start_coord.last).abs == (end_coord.first - start_coord.first).abs
    
  end 

end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
see what makes up diagonal
[0,0] [1,1] 
[0,0] [3,3]
[0,1] [1,2]
[0,1] [2,3]
[3,0] [2,1] 
[3,2] [2,3]


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
def assert 
  raise "Assert Failed!" unless yield 
end
assert{boggle_board.create_word([2,1],[3,1],[3,2],[3,3]) == "cake"}
assert{boggle_board.get_row(3) == ["t", "a", "k", "e"]}
assert{boggle_board.get_col(1) == ["r", "o", "c", "a"]}



# 5. Reflection 

# This exercise was an extension of our boggle board exercise from the previous week. 
# I learned how to use splat operator which is very useful in making our
# parameters more flexible. In #create_word *coords allows us to inserts infinite
# number of coordinates to make up words. Although not required from the directions,
# I created print_all method to print out all the get_col and get_row in our grid.
# It was a good practice in embedding other instance methods shared in BoggleBoard 
# class. Real challenge of this exercise was in Bonus section. I managed to figure 
# out ways to get diagonal values going from top left corner to bottom right but 
# not vice versa. 