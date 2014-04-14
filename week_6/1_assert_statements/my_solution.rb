# U2.W6: Testing Assert Statements


# I worked on this challenge [by myself].


# 2. Review the simple assert statement

# def assert
#   raise "Assertion failed!" unless yield
# end
 
# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# assert is name of the method and is called with a code block
#      unless block parameter returns true always raise an error with the message "Assertion failed!"
# end 
# declare variable name with a string bettysue 
# call assert method with a block of code that results to true and returns nil 
# call assert method with a block of code that results to false and returns an error with message "Assertion failed!"



# 3. Copy your selected challenge here
####################################
## Week 4 Group Creator Challenge ##
####################################
fence_lizards = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", 
                "Alison Wong", "Andra Lally", "Anup Pradhan",
                "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff",
                "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", 
                "Eiko Seino", "Eoin McMillan", "Hunter T. Chapman", 
                "Jacob Persing", "Jon Pabico", "Parjam Davoody",
                "Samuel Davis", "Sebastian Belmar", "Shawn Seibert",
                "William Bushyhead", "Yuzu Saijo", "Christiane Kammerl"]

def unit_picker(names)
   shuffled_names = names.shuffle
   result = Hash.new([]) 
   i = 1
   while(i <= 6) do 
   	 4.times { result["group_""#{i.to_s}"] += ["#{shuffled_names.pop}"] }
     i += 1
   end
   result 
end

def  phase_picker(names,num_units=3)
  final = {}
  i = 1
  while (i <= num_units) do
    final["unit_""#{i.to_s}""_groups"] = unit_picker(names)
    i += 1
  end
  final 
end


puts unit_picker(fence_lizards).keys.size == 6
puts unit_picker(fence_lizards).values.flatten.size == fence_lizards.size 
puts unit_picker(fence_lizards).values.flatten.sort == fence_lizards.sort 
puts unit_picker(fence_lizards).values.uniq.size == 6 
puts phase_picker(fence_lizards,100).keys[-1] == "unit_100_groups" 
puts phase_picker(fence_lizards).keys.size == 3 
puts phase_picker(fence_lizards)["unit_1_groups"]["group_1"] != phase_picker(fence_lizards)["unit_2_groups"]["group_1"] 
puts phase_picker(fence_lizards)["unit_2_groups"]["group_1"] != phase_picker(fence_lizards)["unit_3_groups"]["group_1"] 




# 4. Convert your driver test code from that challenge into Assert Statements

def assert 
  raise "Assertion failed!" unless yield 
end

assert{unit_picker(fence_lizards).keys.size == 6}
assert{unit_picker(fence_lizards).values.flatten.size == fence_lizards.size }
assert{unit_picker(fence_lizards).values.flatten.sort == fence_lizards.sort }
assert{unit_picker(fence_lizards).values.uniq.size == 6 }
assert{phase_picker(fence_lizards,100).keys[-1] == "unit_100_groups" }
assert{phase_picker(fence_lizards).keys.size == 3 }
assert{phase_picker(fence_lizards)["unit_1_groups"]["group_1"] != phase_picker(fence_lizards)["unit_2_groups"]["group_1"] }
assert{phase_picker(fence_lizards)["unit_2_groups"]["group_1"] != phase_picker(fence_lizards)["unit_3_groups"]["group_1"] }


# 5. Reflection 

# In this exercise I learned a different way to write a driver code. 
# This method seems more similar to RSPEC tests in that this new method 
# outputs error messages when there is an error. The console outputs the
# lines pointing to the place causing problems which makes it easy to 
# spot errors. When there are long lines of true/false statements, you may
# run into problems figuring out which line problem is occuring. This was 
# a short but a good learning experience.