# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

#when the method is called pass in argument as 'sentence'
def translate_to_cipher(sentence)
#convert range into an array by placing each letter into corresponding indices 
    alphabet = ('a'..'z').to_a
#rotates alphabet array so index 4 is the first element in an array and create
#antoehr array and organize based on indices [['a','e'],['b','f']...] 
#then convert into hash and store it in variable named cipher 
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
#store special characters in an array and store it in variable named spaces
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
#convert sentence to all lowercase letters and store it in variable named original_sentence    
    original_sentence = sentence.downcase
#store new empty array in variable named encoded_sentence
    encoded_sentence = []
#iterate through each character in the string sentence
    original_sentence.each_char do |element|
#if any of the keys in cipher matches up with element ...
      if cipher.include?(element)
#push the corresponding value into the new array
        encoded_sentence << cipher[element]
#if any of the element is blank space ...
      elsif element == ' '
#get a random value from the array spaces 
        encoded_sentence << spaces.sample
      else 
#for everything else just push in the element without formatting
        encoded_sentence << element
      end
     end
#convert the array into a string     
    return encoded_sentence.join
end


# Questions:
# 1. What is the .to_a method doing? 
#     this method converts a range into an array by expanding the range first and assigning every
#     element to each indices
# 2. How does the rotate method work? What does it work on?
#     rotate method works on an array. it takes an index as a parameter and rotates the whole array
#     setting the index value of a first element.
# 3. What is `each_char` doing?
#      each_char is going through each character in a string and applying the block
# 4. What does `sample` do?
#      sample outputs a random element in an array
# 5. Are there any other methods you want to understand better?
#      not at the moment
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
#      this code looks better than our original cipher code. Me and my partner had a similar idea in our
#      pesudo code however we didn't know built in methods in order to solve our problem. 
#      creating cypher looks better using zip and rotate method. Also conversion from three dimentional array
#      to Hash is very clean and useful. Also if..else part of the code without break and found_match = true 
#      adds readability and efficiency 
# 7. Is this good code? What makes it good? What makes it bad?
#      This is a good code because it is clean and minimizes method used. Also this code follows DRY rule
#      I can't find anything bad about this code.

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time? 
#  It does not return the same output every time because of spaces.sample returning random value in an array, spaces.
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")


# 5. Reflection 

# This exercise did not involve much strategy besides following simple directions given. I used 
# ruby-doc website for all of my resources. Spending over 2 hours in refactoring our solution for
# the group exercise it was refreshing to see a lot of short hand notations. I learn new syntax the
# best when I look at the example since it can be difficult explaining their functions in words. New 
# methods that I learned were zip,rotate, and each_char. I also learned Hash keyword which takes
# a parameter inside brackets where it converts an array into hash.

