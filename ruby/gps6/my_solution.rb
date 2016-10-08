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

# 'hashy hash' is used because strings are used and we don't have to re-convert it.
# Most importantly, the symbol is efficient because instead of storing
# strings.
# When you call strings, you make a new instance of a string.
# The object ID is different from each string.
# The symbol is more of immutable stringholder.

# What does require_relative do? How is it different from require?

# the difference between two different hash styles.
# two hashes are necessary becaue (i) you essentially have key,value;
# (ii) nested value is necessary. The 'value' hold multiple values.

# What are some ways to iterate through a hash?

# .each | .map

# When refactoring virus_effects, what stood out to you about the variables, if anything?

# What concept did you most solidify in this challenge?
# hashes
