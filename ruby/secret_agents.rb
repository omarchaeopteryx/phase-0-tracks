# Challenge 4.6

# 1. Encrypt pseudocode

# - Loop through each letter
# - Add 1 to the letter at each index
# - If the value at the index is equal to a "space", then go to the next letter
# - Until you've reached the last letter

def encrypt(string)
	i = 0
	while i < string.length
		if string[i] == " "
			string[i] = string[i]
		elsif string[i] == "z"
			string[i] = "a"
		else
			string[i] = string[i].next
		end	
		i += 1
	end
	puts string
end

# encrypt("cat dog")

# 2. Decrypt pseudocode

# - Loop through each letter of the encoded word
# - Go back one in the alphabet at each index
# - (Come back to this)
# - If the the value at the index is equal to a "space", then go to the next letter
# - Until you've reached the last letter

def decrypt(string)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	decrypted_string = ""

	i = 0
	while i < string.length
		if string[i] == " "
			decrypted_string << string[i]
		else
			j = alphabet.index(string[i]) - 1
			decrypted_string << alphabet[j]
		end	
		i += 1
	end
	decrypted_string
end

# puts decrypt("dbu eph")
# puts encrypt("abc")
# puts encrypt("zed")
# puts decrypt("bcd")
# puts decrypt("afe")

# puts decrypt(encrypt("swordfish"))

# The code is solving for one method, and then using the results of that method as the input
# into the next method, when they're nested (as in the "swordfish" example). This works because
# both methods are returning a string, but if one method returns something else, it wouldn't work
# because you can't decrypt something that's not a string.

# release 5 - putting in our driver code!

# Ask agent/user whether they want to decrypt or encrypt password

puts "Hello. Would you like to decrypt or encrypt a password?"
answer = gets.chomp

# Ask for password

puts "What is the word you would like to run?"
keyword = gets.chomp

# Conduct requested operation, print, exit

if answer == "decrypt"
	print decrypt(keyword)
elsif answer == "encrypt"
	print encrypt(keyword)
else
	puts "You must be a spy! Goodbye."
end

exit
