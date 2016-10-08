# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'
# this require_relative is loading the data from 'state_data' since it's in the same folder.
# we usually use require to get extra classes and gems to get extra that's not built into ruby.
# If we use require, we can get other classes. require_relative is more flexible.


class VirusPredictor

  def initialize(state_of_origin)
    # initialize method. takes 3 arguments for initialize.
    @state = state_of_origin
    @population = STATE_DATA[@state][:population]
    @population_density = STATE_DATA[@state][:population_density]
  end


  def virus_effects
    # calls two other methods (which takes 3 arguments defined.)

    print "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"

  end

private
# users can't call it outside the method. that's what private does to us.
# we need to use private method at times because:
# protects the code. users won't be able to accidentally call.


  def predicted_deaths
    # predicted deaths is solely based on 3 arguments.
    # it appears to output values that's dependent on if/else statements
    # indicates number of deaths in given state.
    # finally prints it out.
    if @population_density >= 200
      rate = 0.4
    elsif @population_density >= 150
      rate = 0.3
    elsif @population_density >= 100
      rate = 0.2
    elsif @population_density >= 50
      rate = 0.1
    else
      rate = 0.05
    end

    (@population * rate).floor

  end

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    # two argument-driven. depending on if/else, it spits out the speed value.
    # finally prints out after too.

    if @population_density >= 200
       0.5
    elsif @population_density >= 150
       1
    elsif @population_density >= 100
       1.5
    elsif @population_density >= 50
       2
    else
       2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

# Answer for Release 4: We can write outside of the class
# because we are pulling instances. Instances can pull outside the class.

STATE_DATA.each {|state, inner_hash| VirusPredictor.new(state).virus_effects  }
# STATE_DATA.each do |state, inner_hash|

# selected_state_report = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population])
# selected_state_report.virus_effects
# # because state is a string in a hash, #is redundant.

# end
# .each loop makes sense.
# loop do would have to loop over something to get the states.
# we already have all the objects we need, therefore .each.

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?

# The outer, 'hashy hash' allows us to more easily retrieve the keys as strings of the (object String class) already. If we were to call them using symbols, we would then have to convert them in an additional step. It is also for efficiency reasons that we then create symbols for "population density" and "population" in the sub-hash. Using symbols creates objects that are unique to each symbol, and therefore we only have one case of that symbol held in the computer's memory; each string we create, on the other hand, would take up a new space in the memory (a new object ID)-- this is why we don't write "population" as a string. Symbols are, as our Guide called it, 'immutable'.

# What does require_relative do? How is it different from require?

# The `require_relative` notation allows us to read-in and interact with a file that is stored locally. It's more common to use this notation for, as in this case, reading in a constant or dataset, because the alternative `require` style is preferred for loading Modules or Classes.

# What are some ways to iterate through a hash?

# .each | .map are both ways to iterate through a hash. In these cases you would have to track which keys, values you would like the block of code to access in order to retrieve the right variables.

# When refactoring virus_effects, what stood out to you about the variables, if anything?

# The lengths of the variable names was one thing, in addition to their being repeated a few times within each instance method.

# What concept did you most solidify in this challenge?

# For me, personally, the practices of refactoring started to stick in this challenge. For instance, it made a lot of sense when we created a "result" return (after first defining a variable) for the "numbers of deaths" rather than repeating the calculation over and over with different rates. It made sense to me to write a generalized equation, and think about what value you want to come out of it, and then work from there. Always good to get more hash practice, too.
