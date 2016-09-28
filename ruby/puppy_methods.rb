# class Puppy
#   def initialize
#     puts "Initializing new puppy instance ..."
#   end
#
#   def fetch(toy)
#     puts "I brought back the #{toy}!"
#     toy
#   end
#
#   def speak(number)
#     number.times do
#       puts "Woof!"
#     # "Woof! " * n
#     end
#   end
#
#   def roll_over()
#     puts "*rolls over*"
#   end
#
#   def dog_years(years)
#     if years == 1
#       dog_age = 15
#       puts "Your dog is #{dog_age}"
#     else
#       dog_age = 16 + 4*(years)
#       puts "Your dog is #{dog_age}"
#     end
#     dog_age
#   end
#
#   def chase_cat()
#     puts "*chases a cat away*"
#   end
# end
#
# # Driver Code
#
# spot = Puppy.new
# spot.fetch("Ball")
# spot.speak(5)
# spot.roll_over
# spot.dog_years(2)
# spot.dog_years(7)
# spot.dog_years(1)
# spot.chase_cat
# # spot.initialze testing misspelling

class Breakfast
  def initialize
    puts "Initializing Breakfast ..."
    @feeling = ["hyped", "sleepy", "ready to jump the moon"].sample
    @cups = rand(30)
    @names = ["Omar", "Pablo", "Ty"].sample
  end

  def drink
    puts "#{@name} drinks #{@cups} cups of coffee!"
  end

  def status
    puts "I feel #{@feeling}"
  end
end

# Driver code

# joe = Breakfast.new # Testing out new instance
# joe.drink("He-man")
# joe.status

breakfast = []
50.times do
  breakfast << Breakfast.new()
end
p breakfast

breakfast.each do |user|
  puts user.drink
  puts user.status
end
