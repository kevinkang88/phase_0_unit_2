# U2.W4: Accountability Group Creator!


# I worked on this challenge [with: Sebastian Belmar].

# make a method that takes array of names 
# this method will output list of Accountability groups 
# for three different units 
# should get everyone into an Accountability group of 4 

# things to consider
# Are there built-in methods to do this in Ruby?
# Will you try to avoid putting the same people together more than once?
# If I run this program three times in a row, will the program give me three different outputs? Is that good or bad?
# Should it remember past outputs or not? 


# 2. Pseudocode

# define unit_picker that takes array as a parameter 
# create an empty hash called result
# randomize an array
# While loop and use a times loop inside to pop elements into a hash until array 
#       size equals zero
# outputs a hash, result
#   {
#     group_1 => ['kevin,asf,asdf,asdf]
#     group_2 => ['kevin,asf,asdf,asdf]
#     group_3 => ['kevin,asf,asdf,asdf]
#     group_4 => ['kevin,asf,asdf,asdf]
#     group_5 => ['kevin,asf,asdf,asdf]
#     group_6 => ['kevin,asf,asdf,asdf]
# }
#
# define phase_picker that takes an array and number of units(n) as parameters
# run unit_picker n number of times and create a final hash 
# return hash, final
# result = {
#   unit_1_groups =>{
#     group_1 => ['kevin,asf,asdf,asdf]
#     group_2 => ['kevin,asf,asdf,asdf]
#     group_3 => ['kevin,asf,asdf,asdf]
#     group_4 => ['kevin,asf,asdf,asdf]
#     group_5 => ['kevin,asf,asdf,asdf]
#     group_6 => ['kevin,asf,asdf,asdf]
#
#   unit_2_groups =>{
#     group_1 => ['kevin,asf,asdf,asdf]
#     group_2 => ['kevin,asf,asdf,asdf]
#     group_3 => ['kevin,asf,asdf,asdf]
#     group_4 => ['kevin,asf,asdf,asdf]
#     group_5 => ['kevin,asf,asdf,asdf]
#     group_6 => ['kevin,asf,asdf,asdf]
#  }
# }
#
#
# 3. Initial Solution
fence_lizards = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", 
                "Alison Wong", "Andra Lally", "Anup Pradhan",
                "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff",
                "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", 
                "Eiko Seino", "Eoin McMillan", "Hunter T. Chapman", 
                "Jacob Persing", "Jon Pabico", "Parjam Davoody",
                "Samuel Davis", "Sebastian Belmar", "Shawn Seibert",
                "William Bushyhead", "Yuzu Saijo", "Christiane Kammerl"]



# def unit_picker(names)
#   shuffled_names = names.shuffle
#   result = Hash.new([]) 
#   i = 1
#   while(i <= 6) do 
#   	 4.times do
# 	     result["#{"group_" + i.to_s}"] += ["#{shuffled_names.pop}"]
# 	 end
#     i += 1
#   end
#   result 
# end

# def  phase_picker(names,num_units=3)
#   final = Hash.new()
#   i = 1
#   while (i <= num_units) do
#     final["#{"unit_"+i.to_s+"_groups"}"] = unit_picker(names)
#     i += 1
#   end
#   final 
# end


# 4. Refactored Solution

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


# 1. DRIVER TESTS GO BELOW THIS LINE

puts unit_picker(fence_lizards).keys.size == 6 # we have 6 groups in each unit
puts unit_picker(fence_lizards).values.flatten.size == fence_lizards.size # we have 24 people total in each unit
puts unit_picker(fence_lizards).values.flatten.sort == fence_lizards.sort # we are not reapiting people inside groups in each unit 
puts unit_picker(fence_lizards).values.uniq.size == 6 # there are no gruops that are equal to each other
puts phase_picker(fence_lizards,100).keys[-1] == "unit_100_groups" #when you pass in n number of units returns the correct key "unit_n_groups"
puts phase_picker(fence_lizards).keys.size == 3 #not passing in number of units should equal to 3 units 
puts phase_picker(fence_lizards)["unit_1_groups"]["group_1"] != phase_picker(fence_lizards)["unit_2_groups"]["group_1"] #elements in unit 1 group 1 should be differnt from elements in unit 2 group 1
puts phase_picker(fence_lizards)["unit_2_groups"]["group_1"] != phase_picker(fence_lizards)["unit_3_groups"]["group_1"] #elements in unit 2 group 1 should be differnt from elements in unit 3 group 1


# 5. Reflection 
# One of the things we did while pseudo coding was to write out the sample return value of each
# method. Doing this helped us keep track of what was going on since the return value was 
# relatively complicated hash object within another hash object. Using the while loop to 
# declare key values and times method to pop elements into corresponding key 4 times worked 
# very nicely. We had problem figuring out why line 101 was giving us en error. We were simple 
# only used to passing in single integer or symbol in between the brackets but after getting
# the syntax down it was not a problem at all. This was my first time being really stuck at a 
# problem but having a partner who was more knowledgeable about Ruby syntax was helpful.