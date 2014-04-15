# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
#declare class called PezDispenser
#  create #initialize that takes an array of flavors if nothing is passed empty array becomes an argument
#    set flavors to instance variable flavors
#  create #pez_count that returns length of flavors 
#  create #see_all_pez that returns list of flavors
#  create #add_pez that takes a flavor as parameter and pushes that flavor into existing @flavors array 
#  create get pez that returns first value of the @flavors array 


# 3. Initial Solution

class PezDispenser
  
  def initialize(flavors=[])
    @flavors = flavors
  end

  def pez_count
    @flavors.size
  end

  def see_all_pez
    @flavors
  end

  def add_pez(flavor)
  	@flavors << flavor 
  end
  
  def get_pez
    @flavors.shift
  end
end
 


# 1. DRIVER TESTS GO BELOW THIS LINE


flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"

def assert
  raise "Assert failed!" unless yield
end

yoshi = PezDispenser.new()
assert{PezDispenser.method_defined?(:pez_count)}
assert{PezDispenser.method_defined?(:add_pez)}
assert{yoshi.add_pez("mystery") == ["mystery"]}
yoshi.add_pez("poop")
assert{yoshi.pez_count == 2}
assert{yoshi.see_all_pez.size == 2}
assert{yoshi.get_pez == "mystery"}


# 5. Reflection 

# This exercise was fairly simple because each methods listed only had one simple
# task that had to be done. It focused more on the translating given user stories
# to our pseudocode and writing our coded solution. I realized whenever there is a
# phrase “I would like to…”, it is a good idea to create a new method even though 
# you end up combining some of them when refactoring. Having sample code(lines 57-67) 
# helped me a lot in giving example run of what user would do with a program. I will 
# consider adding this stage to my coding process next time. 