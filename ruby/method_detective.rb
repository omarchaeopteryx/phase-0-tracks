# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

# "zom".<???>
# => “zoom”

puts "zom".sub("o","oo")
puts "zom".gsub("o","oo")

# "enhance".<???>
# => "    enhance    "

puts "enhance".center(15," ")

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"

puts "Stop! You’re under arrest!".upcase
puts "Stop! You’re under arrest!".upcase!

# "the usual".<???>
#=> "the usual suspects"

puts 'the usual'.concat(" suspects")

# " suspects".<???>
# => "the usual suspects"

puts " suspects".prepend("the usual")

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

puts "The case of the disappearing last letter".chop

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

puts "The mystery of the missing first letter".gsub("T","")

puts "The mystery of the missing first letter".gsub!("T","")

puts "The mystery of the missing first letter".sub("T","")

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

puts "Elementary,    my   dear        Watson!".squeeze

# "z".<???>
# => 122
# (What is the significance of the number 122 in relation to the character z?)

puts "z".ord # This is the ASCII ordinal value of the letter 'z', which the computer uses in conversion.

# "How many times does the letter 'a' appear in this string?".<???>
# => 4

puts "How many times does the letter 'a' appear in this string?".count("a")
