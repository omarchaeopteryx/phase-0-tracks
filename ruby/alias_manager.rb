# OM
# DBC, Week 5, Challenge 5.5

# *** Designing an alias method! ***

# Goal: change all the vowels into the next vowel in the aeiou sequence.
# Goal: change all the consonants into the next consonant in the alphabet.
# Goal: add user interface that repeats the process and stores results till end.

# First, get the user's name and swap the first and last name:

full_user_record = []

def name_prep(input)
  x = input
  x = x.downcase
  output = x.split(' ') # Create an array of the name
  output.reverse! # Reverse the name
  return output
end

# Starting a loop that goes on until user enters "done":

loop do
  puts "Welcome, Agent. What are your first and last names?"
  full_user_name = gets.chomp
  break if full_user_name == "done"
  altered_user_name = name_prep(full_user_name) # For usage
  new_total_name = [] # TBD
  final_user_names = [] # TBD

  # Preparing hash and array sets for shifting indexes later:

  alphabet_consonants_array = "bcdfghjklmnpqrstvwxyz".split('')
  # p alphabet_consonants_array
  alphabet_consonants_hash = {

    z:"b",b:"c",c:"d",d:"f",f:"g",g:"h",h:"j",j:"k",k:"l",l:"m",m:"n",n:"p",p:"q",q:"r",r:"s",s:"t",t:"v",v:"w",w:"x",x:"y",y:"z"
  }
  # p alphabet_consonants_hash
  alphabet_vowels_array = "aeiou".split('')
  # p alphabet_vowels_array
  alphabet_vowels_hash = {a:"e",e:"i",i:"o",o:"u",u:"a"}
  # p alphabet_vowels_hash

  r = [[],[]]  # Creating a blank array to store scrambled names from below.

  # Creating a loop that scrambles the first (last) and second (first) names and uses hash searches for the vowel- and consonant-shifting process:
  i = 0
  while i < altered_user_name.length
    alt_base = altered_user_name[i].split('')
    z = 0
    while z < alt_base.length
      query = alt_base[z].to_sym
      if alphabet_consonants_array.include?(alt_base[z])
        r[i] << alphabet_consonants_hash[query]
      else
        r[i] << alphabet_vowels_hash[query]
      end
        z += 1
      end
    i += 1
    r
  end

  # Combining the letters of the names into strings, with first letters capitalized:

  new_first_name = r[0].join.capitalize
  new_last_name = r[1].join.capitalize # Note: was getting bug with .first! so .capitalize seems to work better here.

  new_total_name << "#{new_first_name} #{new_last_name}"
  new_total_name

  # Reading out the results and storing them for later:

  puts entry = "#{full_user_name} is: #{new_first_name} #{new_last_name}."
  full_user_record << entry
  entry
end

puts "Here is your agents list (DO NOT SHARE):"

full_user_record.each {|i| puts ">>> " + i}

puts "Goodbye."


# Notes: There are a couple ways to do it. I imagine you could scroll through each letter of the alphabet, save it into a new index, and then just perform shift on each of those index items.

# Otherwise, the way to do it is to parse the inputs in to letters, and then into hashes you can search for the corresponding shape they're going to change into and then you find that, and replace the original (or a dummy) with that. Don't know what's better.

# What we need to do is, take the user's input, split it into its constituent parts, and then compare one by one each item against a hash (convert each to a symbol in turn) and scry which value in the encryption key it corresponds to, then store the result of that as next in the list in a resulting array. Do it for each of the array items (last name first, last name second) in turn, which will work because it's a nested array within an array! If you do each index of the names [last, first] separately and do all of the above.

# Then to close you simply print the last name index + first name index and you're good.
