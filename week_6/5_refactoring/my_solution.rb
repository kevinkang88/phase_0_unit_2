# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself].

########################
## Original from peer ##
########################

# class CreditCard
# 		def initialize(creditCardValidation)
# 		@creditCardValidation = creditCardValidation
# 		unless creditCardValidation.to_s.length == 16
# 		raise ArgumentError.new("Please enter a valid credit card number.")
# 	end
# end

# def check_card
# 		cc = @creditCardValidation.to_s.split("")
# 		credit_card_doubled = []

# 		cc.each_with_index do |x, i|
# 			if i % 2 == 0
# 				number_times_two = x.to_i*2
# 				number_times_two.to_s.split(//).each { |i| credit_card_doubled << i.to_i } 
# 			elsif i % 2 == 1
# 				credit_card_doubled << x.to_i
# 			end
# 		end

# 		credit_card_summed = credit_card_doubled.reduce(:+)

# 		credit_card_summed % 10 == 0 ? true : false

# 	end
# end


#########################
## refactored solution ##
#########################

#first things first I changed the formatting to standard 2 character spaced tab
#since we are using same number that was initialzed to check card I m going to nest #check_card inside CreditCard class

class CreditCard
  def initialize(card_num) #I changed a long camelcased variable to more concise snaked variable name standard in Ruby
    @card_num = card_num
	raise ArgumentError.new("Please enter a valid credit card number.") unless card_num.to_s.length == 16
  end

  def check_card
    cc_ary = @card_num.to_s.split("") #changed variable name to represent which class it contains 
    credit_card_doubled = []

    cc_ary.each_with_index do |x, i|
      if i.even? #changed to more simple method that does the same task
	    number_times_two = x.to_i*2
	    number_times_two.to_s.split(//).each { |i| credit_card_doubled << i.to_i } 
      else #since this block should cover everything else that is not covered by first if statement no need for arguments
	    credit_card_doubled << x.to_i
	  end
    end

    credit_card_summed = credit_card_doubled.reduce(:+)

    credit_card_summed % 10 == 0 ? true : false

  end
end




# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assert Failed!" unless yield
end

assert{CreditCard.new(4408041234567893).check_card == true}
assert{CreditCard.new(4408041234567892).check_card == false}
begin 
  CreditCard.new(12345678910)
rescue ArgumentError
end

# Reflection

# This code stood out to me because his approach to the problem 
# compared to my solution. One of the things I noticed was that 
# check_card method should be inside the method since they will 
# share initialized credit card number with other methods. After 
# altering the frame of the code, there were not much to refactor 
# besides making long methods into shorter sweeter method. For 
# example statement such as i % 2 == 0 could be easily replaced by 
# #even? method. I also learned about #each_with_index method that I 
# could see being useful in future problems. 