# Pseudocode by OM for DBC Challenge 5.2

# PART I.

# Build an empty hash structure.

client = {
  # name:na,
  # city:na,
  # start:na,
  # appr:na,
  # style:na,
  # other:na
}

# Also building array of questions which can be cycled through.

questions = ["What is the Client's name?","What city to they live in?", "What year does the project start?", "True of False: their project has been approved?", "What is their favorite design style?", "Do you want to update anything in the list? (Please type any key if so. Type 'none' if not.)"]

answers = []

# Setting up methods for checking input type (necessary?).

def stringcheck(input)
  if input.is_a? String
    input = input
  else
    input = input.to_s
  end
end

def numcheck(input)
  if input.is_a? Fixnum
    input = input
  else
    input = input.to_i
  end
end

# stringcheck("allo")  <-- Testing out the string and number checks!
# stringcheck(5)
# numcheck("allo")
# numcheck(5)

# PART II.

# Ask an interior designer to enter the details of a client.

puts "Welcome to the client application!"

puts "We're going to ask you a series of questions."

# Go through a list of questions, including string and numerical and boolean answers, and store the answers.

count = 0

while count < questions.length - 1
  puts "#{questions[count]}"
  answer = gets.chomp
  answers[count] = answer
  count += 1
end

# p answers

# # Be sure to convert answers to appropriate types (string, integer, etc).

client[:name] = stringcheck(answers[0])
client[:city] = stringcheck(answers[1])
client[:year] = numcheck(answers[2])

if answers[3] == "True"
  client[:appr] = answers[3] === "True"
elsif answers[3] == "False"
  client[:appr] = answers[3] === "False"
else
  client[:appr] = "N/A"
end

client[:fav] = stringcheck(answers[4])

# When done, PRINT the hash.

p client

# Ask user if they want to update anything in the list.

puts "#{questions[-1]}"

update = gets.chomp

## If yes, ask which KEY, then ask for VALUE and change that KEY's value.

if update != "none"
  puts "Which keyword do you want to change?"
  key = gets.chomp
  key = key.to_sym  # At last! This is how you convert input to symbol for querying purposes!!!
  if client.include?(key)
    puts "What would you want to change it to?"
    newhash = gets.chomp
    client[key] = newhash
  else
    puts "Move along, designer! Time is money."
  end
else # If 'none' skip to below.
end
# PRINT the new hash.
puts "Thank you."
p client
