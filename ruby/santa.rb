# Om, Challenge 6.3

# Creating a new class, Santa
class Santa
  def initialize
    puts "Initializing Santa instance..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end
end

# Driver code below

kringle = Santa.new()
# kringle.initialize <-- not necessary
kringle.speak
kringle.eat_milk_and_cookies("chocolate chip")
