# Release 0
# Write your own method that takes a block
# should print a status message before and after running the block

def cat_names
	name1 = "Dante"
	name2 = "Damien"
	name3 = "Drogo"
	puts "This method will print out cat names!"
	yield(name1)
	yield(name2)
	yield(name3)
end

cat_names {|name| puts "You've just adopted #{name}!"}


# # # OR can be done this way:

def cat_names
	puts "This method will print out cat names!"
	yield("Dante")
	yield("Damien")
	yield("Drogo")
end

cat_names {|name| puts "You've just adopted #{name}!"}
puts "Good luck with your new cat!"



# # OR this way puts all the names in one line of printout

def cat_names
	puts "This method will print out cat names!"
	yield("Dante", "Damien", "Drogo")
end

cat_names {|name1, name2, name3| puts "You've just adopted #{name1}, #{name2}, and #{name3}!"}



# Release 1
# Delare and array and a hash and populate with some data
# Print raw data
# Demonstrate we can iterate through each one w/the .each method
# Then use the .map! to modify the data
# NOTE: can't call .map! on a hash, only on an array
# Print final data

# Each method on array:
cat_names = ["Dante", "Damien", "Drogo"]
puts "Here are the cat names in the array:"
p cat_names

cat_names.each do |name|
	puts "This cat is #{name}!"
end

puts "The cat array is:"
p cat_names

# # Map! method on array:
cat_names = ["Dante", "Damien", "Drogo"]
puts "Here are the cat names in the array:"
p cat_names

cat_names.map! do |name|
	name.upcase
end

puts "The cat array is:"
p cat_names

# Each on our hash:

cat_name_age = {
	Dante: 5,
	Damien: 10,
	Drogo: 99
}
puts "Here are the cat names and ages in the hash:"
p cat_name_age

cat_name_age.each do |name,age|
	puts "This cat is #{name}! It's #{age} years old."
end

p cat_name_age


# Release 2: Use the documentation  to find other Arrary and Hash methods that take blocks,
# and that can be used to accomplish the tasks below.

# Add simple calls to this doc -- one for the array and one for the hash

# Method that iterates through items, deleting any that meet a certain condition
# .delete_if

age = [5, 10, 99]
age.delete_if {|age| age < 10}

age_weight = {
	5 => 11,
	10 => 8,
	99 => 20
}
age_weight.delete_if {|age, weight| age < 10}

# Method that filters a data structure for items that do satisfy a certain condition
age = [5, 10, 99]
age.select {|age| age < 10}

# Method that filters a data structure for only items satisfying a certain condition
age = [5, 10, 99]
age.find {|age| age.even?}

# Method that removes items from a data structure and does so until the condition in
# the block evaluates to false.  And then stops

age = [5, 10, 99]
age.cycle(2) {|age| puts age if < 9}
