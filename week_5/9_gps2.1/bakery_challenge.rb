# # U2.W5: The Bakery Challenge (GPS 2.1)

# # Your Names
# # 1)Lana Rakhman
# # 2)Kevin Kang

# # This is the file you should end up editing. 
 
# def bakery_num(num_of_people, fav_food) #define bakery_num method that takes two arguments
#   my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} #initlizing hash with my_list 
#   pie_qty = 0 #creating and setting variables to zero
#   cake_qty = 0
#   cookie_qty = 0
  
#   has_fave = false #initialize has_fave to false

#   my_list.each_key do |k| #takes each key from my_list hash and iterate through and compare a key to fav_food
#     if k == fav_food #if you find a corresponding key
#       has_fave = true  #switch to true
#       fav_food = k  #set fav_food equals k 
#     end
#   end
  
#   if has_fave == false # throw an error if there is no match inside hash
#     raise ArgumentError.new("You can't make that food")
#   else # if there is a match...
#     fav_food_qty = my_list.values_at(fav_food)[0] # select the corresponding value for the food
#     if num_of_people % fav_food_qty == 0 # if the number of people is evenly divisible 
#       num_of_food = num_of_people / fav_food_qty # 
#       return "You need to make #{num_of_food} #{fav_food}(s)."
#     else num_of_people % fav_food_qty != 0 # if the number of people is not evenly divisible by the qt of favorite food
#       while num_of_people > 0 
#         if num_of_people / my_list["pie"] > 0
#           pie_qty = num_of_people / my_list["pie"]
#           num_of_people = num_of_people % my_list["pie"]
#         elsif num_of_people / my_list["cake"] > 0
#           cake_qty = num_of_people / my_list["cake"]
#           num_of_people = num_of_people % my_list["cake"]
#         else
#         cookie_qty = num_of_people
#         num_of_people = 0
#         end
#       end
#       return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
#     end
#   end
# end
 
###############################################
## INITIAL SOLUTION (REFACTORING GIVEN CODE) ##
###############################################

# def bakery_num(num_of_people, fav_food)
#   my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
#   food_qty = my_list[fav_food]
#   fav_qty = 0
#   second_fav_qty = 0
#   third_fav_qty = 0

#   raise ArgumentError.new("You can't make that food") unless my_list.include?(fav_food)
    
#     if num_of_people % food_qty  == 0 
#        num_of_food = num_of_people / food_qty 
#        return "You need to make #{num_of_food} #{fav_food}(s)."
    
#     else
#        while num_of_people > 0
        
#         max_value = my_list.keep_if {|k, v| k != fav_food}.values.max
#         min_value = my_list.keep_if {|k, v| k != fav_food}.values.min
         
#          if num_of_people / food_qty > 0 
#           fav_qty = num_of_people / food_qty
#           num_of_people = num_of_people % food_qty
          
#           elsif num_of_people / max_value > 0 
#           second_fav_qty = num_of_people / max_value
#           num_of_people = num_of_people % max_value
        
#           else 
#             third_fav_qty = num_of_people
#             num_of_people = 0
#           end
#         end
#       return "You need to make #{fav_qty} #{fav_food}(s), #{second_fav_qty} #{my_list.key(max_value)}(s), and #{third_fav_qty} #{my_list.key(min_value)}(s)."
#    end

# end

###############################################
##            REFACTORED SOLUTION            ##
###############################################

def bakery_num(num_of_people, fav_food)

  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  
  raise ArgumentError.new("You can't make that food") unless my_list.include?(fav_food)
  #when its even
  if num_of_people % my_list[fav_food] == 0
    num_of_even_food = num_of_people / my_list[fav_food]
    return "You need to make #{num_of_even_food} #{fav_food}(s)."
  end
 
  #when its not even and nasty 
  second_fav_food = my_list.key(my_list.select{|k,v| k != fav_food}.values.max)
  third_fav_food  = my_list.key(my_list.select{|k,v| k != fav_food}.values.min)
  
  fav_foods = [fav_food,second_fav_food,third_fav_food]
  
  hashy = fav_foods.inject({}) do |hashy,food|
    hashy[food] = num_of_people / my_list[food]
    num_of_people = num_of_people % my_list[food]
    hashy
  end
  
  #display
  return "You need to make #{hashy["pie"]} pie(s), #{hashy["cake"]} cake(s), and #{hashy["cookie"]} cookie(s)." 
    
end

p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."

#reflection
#
# it took only few moments to figure out what the code is doing so we dove deep into the problem 
# without testing each blocks of code along the way. When we thought we had a perfect code it 
# kept on giving us errors which we couldn't figure out what went wrong. We eventually figured out
# after taking a break from looking at the problem. We have place an important variable inside 
# first if statement that was not being run in certain situations. I learned that error message
# does not always point to the root of the problem especially in loops. I liked how we got to practice
# with a lot of hash methods and learn some new ones as well. This exercise was overall great
# learning experience !