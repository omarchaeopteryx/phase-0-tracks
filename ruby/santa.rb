# OM - DBC, Challenge 6.3

# Creating a new class, Santa

class Santa
  attr_reader :ethnicity
  attr_accessor :age, :gender # Note that accessor allows for both reading and writing, which means gender gets both getter and setter status
  # Release 2, adding getter methods
  #
  @age = 0 # Defaults to zero, not passed on
  # Release 3, refactoring code with attr_reader and attr_accessor

  # def gender=(new_gender)
  #   @gender = new_gender
  # end
  #
  # # def age(my_age)
  # #   @age
  # # end
  #
  # def ethnicity()
  #   @ethnicity
  # end

def initialize(gender,ethnicity,nickname)
    @gender = gender # Takes value at initialiation
    @ethnicity = ethnicity
    @nickname = nickname
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    puts "Initializing Santa instance..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  # Release 2, adding attribute-changing methods
  def celebrate_birthday(given_age)
    @age = given_age + 1
  end

  def get_mad_at(reindeer_name)
    bad_deer = @reindeer_ranking.select {|deer| deer == reindeer_name} # Note: select better than bsearch...
    new_reindeer_ranking = []
    new_reindeer_ranking = @reindeer_ranking.dup
    new_reindeer_ranking.delete(bad_deer)
    # new_reindeer_ranking.delete(_if {|deer| deer == bad_deer})
    puts "You scolded #{bad_deer[0]}!" # Kluge...?
    new_reindeer_ranking << bad_deer
    puts "The reindeer are now in the order:"; new_reindeer_ranking.each {|deer| puts deer}
    bad_deer
  end

end

# DRIVER CODE BELOW:

# kringle = Santa.new("male","black") <-- Initial check that it's working
# kringle.initialize <-- not necessary
# kringle.speak
# kringle.eat_milk_and_cookies("chocolate chip")

# santas = [] <-- Sample code from 6.3 Lesson
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")
# p santas

santas = [] # Updated sample code from 6.3 lesson
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "robot", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Panjabi", "Bothan", "Mystical Creature (unicorn)", "N/A"]
nickname = ["Santa Claus","Kris Kringle","Saint Nick", "Old St. Nick", "Sandy Claws", "Father Christmas","Pagan Nonsense", "Pere Noel"]

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i],nickname[i])
end

# santas.is_a? Array <-- Testing

puts "The Santas at the SantaCon are:"

santas.each {|santa| p santa}

# Release 2+, New driver code

p my_santa = Santa.new("male","Afro-Caribbean",nickname[2])
puts "Your Santa's age is: "; puts my_santa.age=(150)
puts "Your Santa's ethnicity is: " + my_santa.ethnicity
puts "You changed the gender to: " + my_santa.gender=("Unknown") # TRICKY: Had to change ".gender()" to ".gender=()" to get it to work!
my_santa.get_mad_at("Prancer") # For some reason, it's breaking if not Vixen or Donner
