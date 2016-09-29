# Method to create a list

# Make a hash for storing each type of item, and the number of each type of item. (Hash better for this function)

# Making a series of methods to manipulate the grocey list:
grocery_list = {}

# Method to create list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Break up the user's long string with .split
  # Go through each item in the array, and push that to a hash. At the same time, each should have a default value of one.

def create_list(input)
  grocery_list = {}
  # grocery_list.default = 0
  temp_array = input.split(' ')
  p temp_array
  #  p temp_array.kind_of?(Array)  to test if temp_array is in fact an array
  i = 0
  while i < temp_array.length
    temp_array[i]#.to_sym
    grocery_list[temp_array[i]] = 0 # grocery_list[:cheese] = 0
    i += 1
  end
  # i = 0
  # while i < temp_array.length
  #   new_item = temp_array[i]
  #   new_item = new_item.to_sym
  #   grocery_list.store(new_item, 0)
  #   i += 1
  # end
  # temp_array.each { |item|
  #   item.to_sym
  #   grocery_list.store(item, 0)}
  grocery_list
end

  # Update the grocery list hash
  # Show results using the new print method (see below)
  # Return a hash of all the items

# Method to add an item to a list
# input: item name and optional quantity input(name, quantity) is going to be pushed into the grocery list hash
# output: Return item and quantity to confirm.

def add_item(name, quantity)  # grocery_list.add_item(apples,1)
  grocery_list = {}
  quantity = quantity.to_i
  grocery_list[name] = quantity
  grocery_list
end

# Method to remove an item from the list
# input: an existing key from the grocery list hash
# steps: remove the key and the value from the hash
# output: Say, "Item removed!"

def remove_item(grocery_list, deleted_item)
  grocery_list.delete(deleted_item)
  grocery_list
end

# Method to update the quantity of an item
# input: both the key for a grocery list item, and the value for the number
# steps: User inputs the they keyname.
# This overwrites the previous value.
# output: Return item and quantity.

def update_quantity(grocery_list, u_item, u_quantity)
  #u_item.to_sym
  grocery_list[u_item] = u_quantity
  grocery_list
end
# Method to print a list and make it look pretty
# input: When user's ready to print, get the latest version of the grocery list hash.
# steps: Says, "Here's your list of items:"
# Loops through and says how many of each item you have on new lines.
# output: Printing to the screen all of the items.

def print_list(list_to_print)
   puts "Here is your your list:"
   list_to_print.each {|i,v| puts "You have #{v} #{i};"}
end

# DRIVER CODE:

puts "What items do you want to add to the list?"
input = gets.chomp

# Release 2, testing solutions

p grocery_list = create_list(input)
p grocery_list.update(add_item('lemonade',2))
p grocery_list.update(add_item('tomatoes', 3))
p grocery_list.update(add_item('onions',1))
p grocery_list.update(add_item('ice cream', 4))
p remove_item(grocery_list,'lemonade')
p update_quantity(grocery_list,'ice cream',1)

print_list(grocery_list) # Printing the list

# Release 2, updated code
# Release 3, reflection (OM)

# I learned that pseudocode can be difficult if you don't know how all the moving pieces are going to work together (for instance, the "output" here was to be determined depending on our later conclusions). I was also distracted by the previously existing pseudocode which used a style different from my own, and it made me realize that I prefer working from scratch sometimes so the thinking is not constrained by trying right away to meet given specifications.

# The tradeoffs with arrays and hashes in my view are that, with an array, it's conceptually easier to think about looping through indexed items without knowing what the nature of the items are. With the hash, however, it's easier to query (and overwrite) without knowing where in your list or collection the items are. An array also has one variable to deal with at a time when manipulating it in looping code, and the hash needs two arguments.

# A method returns the last object that you tell it to return. That object can be a variable, a string, or a list or an array, etc.

# You can pass any object encountered so far into a method, provided that the steps within the method deal with that object appropriately. For instance, I was having difficulty bringing in an  array and trying to do a hash function to it -- conversely, trying to do a hash function and offering only one input (rather than two for key, value).

# You can pass information between methods by by linking the input argument of one to the output return of another. In this case, the `grocery_list` object was manipulated in a lot of cases, but technically it was a new list each time within the method. But it was easier to keep track of becuase it would be returned by one method, and used as the input for another method (it's sort of like it handing of off, I'd say).

# This challenge helped me to solidify my understanding of how hashes work and how to query them especially. I got a feel for using them rather like an array in the sense that they are indexed by items, which is analogous to being indexed by numbers, and so the syntaxes of the operations are comparable. I'm still having difficulty understanding when are the best cases to use iteration via code blocks (rather than a 'while' loop, for example) and in such cases, whether best to use .map or .each or another function. But perhaps it will become a more natural instinct with more exposure.
