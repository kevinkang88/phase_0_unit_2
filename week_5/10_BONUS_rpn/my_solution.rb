# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself].

# 2. Pseudocode
create a class named RPNCalculator 
define instance method named evaluate that takes one parameter in string form, rpn
  put all the numbers in an arry called num_ary and all the symbols in calc_ary


# Input:
# Output:
# Steps:


# 3. Initial Solution
calc = RPNCalculator.new

calc.evaluate('1 2 +')   # => 3
calc.evaluate('2 5 *')   # => 10
calc.evaluate('50 20 -') # => 30

# The general rule is that 'A B op' is the same as 'A op B'
# i.e., 5 4 - is 5 - 4.
calc.evaluate('70 10 4 + 5 * -') # => 0


class RPNCalculator
  # Define your methods, here!
  def evaluate(rpn)
    num_ary = []
    calc_ary = []
    rpn.split.each do |x|
      if x.to_i.class == Fixnum
        num_ary << x
      rescue 
      	calc_ary << x
      end 
    end

  end

end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
