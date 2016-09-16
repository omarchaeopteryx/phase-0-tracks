puts "what is the hamster's name?"
name = gets.chomp
puts "What volume level does it like(1~10)?"
vol = gets.chomp
vol = vol.to_i
puts "What is the hamster's fur color?"
fur_color = gets.chomp
puts "Is the hamster a good candidate for adoption?"
adopt = gets.chomp
puts "Estimate the age of the hamster?"
age = gets.chomp
if age == ""
	age = nil
	blank_age = "Unknown"
	x = "#{blank_age} years of age" 
else
	age = age.to_i
	x = "#{age} year(s) old" 
end
puts "Hamster's name: #{name},and its volume is #{vol}. It has #{fur_color} fur. And it says #{adopt} to adoption!"
puts x