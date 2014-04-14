# U2.W6: Drawer Debugger


# I worked on this challenge [by myself].


# 2. Original Code

class Drawer

  attr_reader :contents

  def initialize
    @contents = []
    @open = true
  end

  def open
    @open = true
  end

  def close
    @open = false
  end 

  def add_item(item)
    @contents << item
  end

  def remove_item(item = @contents.pop) #what is `#pop` doing? pop is removing the last element in the index and returning it 
    @contents.delete(item)
  end

  def dump  # what should this method return? this method should empty contents array
    puts "Your drawer is empty."
    @contents = []
  end

  def view_contents
    puts "The drawer contains:"
    @contents.each {|silverware| puts "- " + silverware.type }
  end
end 

class Silverware
  attr_reader :clean 
  attr_reader :type

# Are there any more methods needed in this class? Yes I have added clean_silverware method
# 													Also added attr_reader clean for bonus
  def initialize(type, clean = true)
    @type = type
    @clean = clean
  end

  def eat
    puts "eating with the #{type}"
    @clean = false
  end
  
  def clean_silverware
    puts "cleaning silverware #{type}"
    @clean = true 
  end
end

 
knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return? This should return string with no results because dump method on the previous line should reset the array


silverware_drawer.add_item(fork = Silverware.new("fork")) 
fork.eat

#BONUS SECTION
puts fork.clean #added attr reader on line 47 and returns false as it should 

# DRIVER TESTS GO BELOW THIS LINE

def assert 
  raise "Assertion Failed!" unless yield
end 
fav_knife = Silverware.new("fav_knife")
fav_knife.eat 
assert{fav_knife.clean == false}
fav_knife.clean_silverware
assert{fav_knife.clean == true}
secret_spot = Drawer.new 
secret_spot.add_item(fav_knife)
assert{secret_spot.contents == [fav_knife]}
secret_spot.remove_item
assert{secret_spot.contents == []}


# 5. Reflection 

# As we do more refactoring challenges I feel more comfortable looking at other
# peoples codes and figuring out ways to improve them. Also this exercise was 
# good practice in looking at error messages. I was lucky error messages in this
# challenge was straight forward. Sometimes when dealing with errors in loops I 
# realized they don’t always point to right lines of code giving me massive 
# headaches. Also writing driver codes for methods that print strings turned out 
# to be more messy because each time I try to test a code it outputs a string. 
# Maybe RSPEC tests can fix this problem.  