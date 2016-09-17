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
		else
			string[i] = string[i].next
		end	
		i += 1
	end
	string
end

encrypt("cat dog")

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

decrypt("dbu eph")




