# U2.W4: Cipher Challenge


<<<<<<< HEAD
<<<<<<< HEAD
# I worked on this challenge [with: Aki Suzuki].
=======
# I worked on this challenge [by myself, with: ].
>>>>>>> upstream/master
=======
# I worked on this challenge [with: Aki Suzuki].
>>>>>>> FETCH_HEAD



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> FETCH_HEAD
# def north_korean_cipher(coded_message)
#   input = coded_message.downcase.split("") # take input and convert to all lower case characters and put each characters in the element of array input
#   decoded_sentence = []   # create decoded_sentence array
#   cipher = {"e" => "a",   # cipher is a conversion table where key is a input and value is output
#             "f" => "b",   
#             "g" => "c",   
#             "h" => "d", 
#             "i" => "e", 
#             "j" => "f",
#             "k" => "g",
#             "l" => "h",
#             "m" => "i",
#             "n" => "j",
#             "o" => "k",
#             "p" => "l",
#             "q" => "m",
#             "r" => "n",
#             "s" => "o",
#             "t" => "p",
#             "u" => "q",
#             "v" => "r",
#             "w" => "s",
#             "x" => "t",
#             "y" => "u",
#             "z" => "v",
#             "a" => "w",
#             "b" => "x",
#             "c" => "y",
#             "d" => "z"}
<<<<<<< HEAD
            
#   input.each do |x| # going through each characters in input and assigning them the value x
#     found_match = false  #    found_match variable is initially set to false so that the conversion occurs it will act as a switch
#     cipher.each_key do |y| #     iterating through conversion table cipher to match input
#       if x == y  # comparing each string character to the each key values in cipher 
#         puts "I am comparing x and y. X is #{x} and Y is #{y}." #output confirmation
#         decoded_sentence << cipher[y] #if there is a match the value is popped into the array
#         found_match = true
#         break  # we break because we don't want the code to continue after the match is found and terminate most internal loop
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #if it corresponds to any of special characters push empty space 
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) #  if it is any number between 0-9 just insert the number as is into decoded sentence
#         decoded_sentence << x
#         found_match = true
#         break
#       end 
#     end
#     if not found_match  #If there is no match insert the same character as is
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("") #put all the strings together and declare a variable 
 
#   if decoded_sentence.match(/\d+/) #it matches any consequtive characters that are digits
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #divide the matched digits by 100
#   end  
#   return decoded_sentence # What is this returning? returns newly formatted output that is joined
# end


# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # take input and convert to all lower case characters and put each characters in the element of array input
  decoded_sentence = []   # create decoded_sentence array

# Go through range A-Z
# Call inject({}) method to range
# Awesome automation!
    cipher = ('a'..'v').inject({}) do |cipher,x|
      cipher["a"] = "w" 
      cipher["b"] = "x" 
      cipher["c"] = "y" 
      cipher["d"] = "z" 
      cipher["#{(x.ord  + 4).chr}"]  = x
      cipher
    end

  input.each do |x| 
    found_match = false 

    cipher.each_key do |y| 
    case x
      when y
        decoded_sentence << cipher[y]
        found_match = true
        break
      when "@","#","$","%","^","&","*"
        decoded_sentence << " "
        found_match = true
        break
      when (0..9).to_a.include?(x)
        decoded_sentence << x
        found_match = true
        break
      end
    end
    decoded_sentence << x unless found_match
end

  decoded_sentence = decoded_sentence.join("")  
 
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence 
end



# Driver Code:
# # These tests return true
 p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# # Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
 p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
 p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
 p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
 p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
 p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"



# Reflection


# Things we tried to refactor first were the cipher and if..else statement. We decided to tackle the cipher 
# part using inject method but it did not cover the keys from a..d since they have to rotate around to the
# other side which we ended up using literal notation for those. We also switched if..else statement to case
# statements. When we peaked into our next exercise after we finished, there were such methods as 
# rotate and zip that would have made our lives a lot easier and have given us cleaner code. 

=======
def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
=======
>>>>>>> FETCH_HEAD
            
#   input.each do |x| # going through each characters in input and assigning them the value x
#     found_match = false  #    found_match variable is initially set to false so that the conversion occurs it will act as a switch
#     cipher.each_key do |y| #     iterating through conversion table cipher to match input
#       if x == y  # comparing each string character to the each key values in cipher 
#         puts "I am comparing x and y. X is #{x} and Y is #{y}." #output confirmation
#         decoded_sentence << cipher[y] #if there is a match the value is popped into the array
#         found_match = true
#         break  # we break because we don't want the code to continue after the match is found and terminate most internal loop
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #if it corresponds to any of special characters push empty space 
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) #  if it is any number between 0-9 just insert the number as is into decoded sentence
#         decoded_sentence << x
#         found_match = true
#         break
#       end 
#     end
#     if not found_match  #If there is no match insert the same character as is
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("") #put all the strings together and declare a variable 
 
#   if decoded_sentence.match(/\d+/) #it matches any consequtive characters that are digits
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #divide the matched digits by 100
#   end  
#   return decoded_sentence # What is this returning? returns newly formatted output that is joined
# end


# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # take input and convert to all lower case characters and put each characters in the element of array input
  decoded_sentence = []   # create decoded_sentence array

# Go through range A-Z
# Call inject({}) method to range
# Awesome automation!
    cipher = ('a'..'v').inject({}) do |cipher,x|
      cipher["a"] = "w" 
      cipher["b"] = "x" 
      cipher["c"] = "y" 
      cipher["d"] = "z" 
      cipher["#{(x.ord  + 4).chr}"]  = x
      cipher
    end

  input.each do |x| 
    found_match = false 

    cipher.each_key do |y| 
    case x
      when y
        decoded_sentence << cipher[y]
        found_match = true
        break
      when "@","#","$","%","^","&","*"
        decoded_sentence << " "
        found_match = true
        break
      when (0..9).to_a.include?(x)
        decoded_sentence << x
        found_match = true
        break
      end
    end
    decoded_sentence << x unless found_match
end

  decoded_sentence = decoded_sentence.join("")  
 
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence 
end



# Driver Code:
# # These tests return true
 p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# # Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
 p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
 p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
 p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
 p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
 p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"



# Reflection
<<<<<<< HEAD
 
>>>>>>> upstream/master
=======


# Things we tried to refactor first were the cipher and if..else statement. We decided to tackle the cipher 
# part using inject method but it did not cover the keys from a..d since they have to rotate around to the
# other side which we ended up using literal notation for those. We also switched if..else statement to case
# statements. When we peaked into our next exercise after we finished, there were such methods as 
# rotate and zip that would have made our lives a lot easier and have given us cleaner code. 

>>>>>>> FETCH_HEAD
