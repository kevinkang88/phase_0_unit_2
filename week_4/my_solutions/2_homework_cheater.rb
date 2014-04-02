# U2.W4: Homework Cheater!


# I worked on this challenge [by myself].


# 2. Pseudocode
# define a method name essay_writer that takes in parameters title,topic, date, thesis,
#         and pronoun


# the method should output a formatted essay that looking something like this

# (Title) 

# (topic) played an important role in making changes to the society around (date). This essay
# is going to outline the history of (topic) and why it is important. (thesis). Now you know
# why (topic) was a seminal piece in our history.  




# 3. Initial Solution
# 
# def essay_writer(title, topic, date, thesis_statment, gender = "it")
#   if topic.split.size == 2
#     first_name,last_name = topic.split
#     topic_final = last_name + " " + first_name 
#   elsif topic.split.size == 1
#     topic_final = topic  
#   end
  
#   if gender == 'male'
#   	pronoun = 'him'
#   elsif gender == 'female'
#   	pronoun = 'her'
#   elsif gender == 'it'
#   	pronoun = gender 
#   end 
  
#   puts title 
#   puts
#   print topic_final , " played an important role in making changes to the society around #{date}. "
#   print "I wanted to learn more about #{pronoun}. "
#   print "This essay is going to outline the history of #{last_name || topic}. "
#   print "#{thesis_statment} "
#   print "Now you know why #{last_name || topic} was a seminal piece in our history."
# end



# 4. Refactored Solution


def essay_writer(title, topic, date, thesis_statment, gender = "it")
  if topic.split.size == 2
    first_name,last_name = topic.split
    topic_final = "#{last_name} #{first_name}" 
  else 
    topic_final = topic  
  end
  
  case gender 
    when 'male'   then pronoun = 'him'
    when 'female' then pronoun = 'her'
    else               pronoun = gender 
  end 
  
  puts title 
  puts
  print topic_final , " played an important role in making changes to the society around #{date}. "
  print "I wanted to learn more about #{pronoun}. "
  print "This essay is going to outline the history of #{last_name || topic}. "
  print "#{thesis_statment} "
  puts "Now you know why #{last_name || topic} was a seminal piece in our history."
end






# 1. DRIVER TESTS GO BELOW THIS LINE
essay_writer("Title", "Kevin Kang", 2014, "thesis.", 'male') 
puts topic_final == "Kang Kevin"
# pass in a name and see if it divides perfectly
# pass in a place for topic and see if it comes out right in topic final
#pass in male for gender and see if prooun equals him
#pass in female for gender and see if pronoun equals her
#pass in non for gender and see if pronoun equals it




# 5. Reflection 





