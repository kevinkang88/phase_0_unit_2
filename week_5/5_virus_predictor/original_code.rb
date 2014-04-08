# U2.W5: Virus Predictor

# I worked on this challenge [by myself].

# Directions 
# - Run the code. Look at the output. Look at the input (it's in the other file). Explain what the program is doing.
#   This program takes the state_data, calculates the predicted deaths and speed of spread and outputs the results
# - Take a look at the state_data file. What is going on with this hash? What does it have in it? (HINT: There are two different syntax used for hashes here. What's the difference?)
#   STATE_DATA is a hash that includes hash as each values. Each state is represented by String objects and keys of inner hash is represented by Symbols
# - Comment each method and define it's responsibility.
#   intialize : accepts values passed in by the user and sets them to appropriate instance variables
#   virus_effects : displays results from predicted_deaths method and speed_of_spread method.
#   predicted_deaths : takes population and multiplies by a constant according to population density and returns number of deaths and prints outcome in string
#   speed_of_spread : add speed by a constant according state given and output a result in string
# - New Feature: create a report for all 50 states, not just the 4 listed below. Is there a DRY way of doing this?
#   using each to iterate through hash keys. answer is blow 
# - Refactor the virus_effects method. (HINT: what is the scope of instance variables?)
# - What is the purpose of "private". What happens if you move it elsewhere in the class?
#   methods that are decalred under private statement is not accesible directly. predicted_deaths method and speed_of_spread cannot be called from class object
# - Refactor the private methods predicted_deaths and speed_of_spread. How can you make them more DRY?
#   For predicted_deaths I set if..else statement to number_of_deaths
# BONUS: Access the population by calling it on the instance.
# - EXPLANATION OF require_relative
#   adds the contents of passed in file to the library of where it was called

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end
  
  private

  def predicted_deaths(population_density, population, state)
    number_of_deaths = if @population_density >= 200
                         (@population * 0.4).floor
                       elsif @population_density >= 150
                         (@population * 0.3).floor
                       elsif @population_density >= 100
                         (@population * 0.2).floor
                       elsif @population_density >= 50
                         (@population * 0.1).floor
                       else 
                         (@population * 0.05).floor
                       end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  def speed_of_spread(population_density, state) #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state,v|
  vp = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population], STATE_DATA[state][:region], STATE_DATA[state][:regional_spread]) 
  vp.virus_effects
end



