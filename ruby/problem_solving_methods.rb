#Omar and Tae - 5.6

#sample array
# array = [3,55,100,1500,98,2,1]
#
#
# def simple_search(arr , value)
# #    arr.select {|i| i == value ; p arr[i]}
#     counter = 0
#     found = false
#
#     arr.each do |i|
#         while counter < arr.length
#             if value == arr[counter]
#                 return counter
#                 found = true
#             else
#                 #triggers the found variable if value not in array
#                 found = false
#             end
#         counter += 1
#         end
#     end
#
#     #returns nil if number is not found in array
#     if found == false
#         return nil
#     end
#
# end

# Release 1 - Fibonacci Terms

# make method that takes a number of terms in a Fibonnaci sequence

def fib(term)
  fibonacci = [0,1] # example: 0,1,1,2,3
  counter = 2
  term = term.to_i
  if term > 2
    until counter == term
        # added1 = index[-1]
        x = fibonacci[-1]
        y = fibonacci[-2]
        newterm = x+y
        fibonacci.push(newterm)
        # print fibonacci.index(i-2)
        # newterm = fibonacci.index(i-2) + fibonacci.index(i-1)
        # added2 = index[-2]
        # take given number + add two new numbers to get the next fibonacci number in the sequence
        # add this to the array
        # loop until term is met
        counter += 1
    end
  elsif term == 0
    puts "Please enter a valid number"
  elsif term == 1
    fibonacci = fibonacci.take(1)
  elsif term == 2
    fibonacci = fibonacci.take(2)
  else
  end
  fibonacci
end

# Testing out some values

p fib(6)
p fib(10)
p fib(0)
p fib(1)
p fib(2)
p fib(100)

# confirm if it worked by doing fib(100) and comparing it to the number: 218922995834555169026

p fib(100)[-1] == 218922995834555169026 # Testing for true/false


# Release 2 - Sorting Methods

# Given a set of random integers

random = [1,4,6,78,945,733,44,30,7,89,234,33,1]

# We want to sort it from lower number to highest number

# Get the length of the list

def sorter(array)
  l = array.length
  swapped = false
  # Start a loop, do it number of times one less than the length of the array
  p array
  loop do
    (l-1).times do |x|
      p "Looping:"
      ## Look at the first two numbers in the list. If the first item's value is greater than the second item's value, then swap the first item to the right.
      if array[x] > array[x+1]
        p "Testing:"
        var1 = array[x] #shifted right, + 1
        var2 = array[x+1] # shifted left, - 1
        array[x] = var2
        array[x+1] = var1
        swapped = true # Turn swap to true, and start the loop over again
      else
        ## If not, do nothing
      end
      p array
      # If there's no swap that goes on, swap = false and code will break
    end
    break if swapped == true
  end
    array
end
# End the loop

sorter(random)
