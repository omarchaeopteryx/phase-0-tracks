class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
    number.times do
      puts "Woof!"
    # "Woof! " * n
    end
  end

  def roll_over()
    puts "*rolls over*"
  end

  def dog_years(years)
    if years == 1
      dog_age = 15
      puts "Your dog is #{dog_age}"
    else
      dog_age = 16 + 4*(years)
      puts "Your dog is #{dog_age}"
    end
    dog_age
  end

  def chase_cat()
    puts "*chases a cat away*"
  end
end

# Driver Code

spot = Puppy.new
spot.fetch("Ball")
spot.speak(5)
spot.roll_over
spot.dog_years(2)
spot.dog_years(7)
spot.dog_years(1)
spot.chase_cat
