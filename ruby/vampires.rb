# Do the thing! Vampires.txt
# Omar Malik
# DBC Week 4, Sept. 2016

# Date is something I looked up online
require "Date"

# Creating a loop for the number of hires. Going to store the values in the master_list above...

puts "How many employees do you have?"
hires = gets.chomp
hires = hires.to_i
master_list = []

i = 0

while i < hires

  # Setting up some flags

  strike1 = false #age mismatch is first strike
  strike2 = false #liking garlic is second strike
  strike3 = false #not needing insurance is third strike
  strike4 = false #vampire name is the LAST STRAW!!!
  strike5 = false # this is the allergens flag

  puts "What is your name?"
    name = gets.chomp
    name = name.to_s
  if (name == "Dra Cula" || name == "Tu Fang" || name == "Dracula")
    strike4 = true
  end

  puts "How old are you?"
    old = gets.chomp
    old = old.to_i

  puts "What year were you born?"
    thatyear = gets.chomp
    thatyear = thatyear.to_i
    thisyear = (Date.today.strftime("%Y")).to_i
    diff = thisyear - thatyear
    if diff != old
      strike1 = true
    else
      strike1 = false
    end

  puts "Our company cafeteria serves garlic bread. Should we order some for you? (Y/N)"
    bread = gets.chomp
    if bread == "Y"
      stike2 = false
    else
      strike2 = true
    end

  puts "Would you like to enroll in the company's health insurance? (Y/N)"
    health = gets.chomp
    if health == "Y"
      strike3 = false
    else
      strike3 = true
    end

  suspect = 0

  # UPDATE: One Last Question (that overrides the above)!
  puts "Final question - please list any allergies you have (enter as many as you have). Please type 'done' when finished."

  done = false
    until done == true
      allergen = gets.chomp
      if allergen == "sunshine"
        strike5 = true
        suspect = 2
        done = true
        break
      elsif allergen == "done"
        suspect = suspect
        done = true
      else
        suspect = suspect
      end
    end

    # Next step: The evaluation portion

  if strike5 != true
    if strike1 == false && (strike2 == false || strike3 == false)
        suspect = 1
      elsif strike1 == true
        if (strike2 == true || strike3 == true)
          if (strike2 == true && strike3 == true)
              suspect = 3
            elsif (strike2 == false && strike3 == true)
              suspect = 2
            elsif (strike2 == true && strike3== false)
              suspect = 2
            else
              suspect = suspect
            end
          end
        elsif strike4 == true
          suspect = 4
        else
          suspect = suspect
        end
      else
        suspect = suspect
    end

    if strike4 == true
      suspect = 4
    end
  # Step: Finding final results here...
  puts "Suspect Level: #{suspect}."

  if suspect == 1
      result = "Probably not a vampire."
    elsif suspect == 2
      result = "Probably a vampire."
    elsif suspect == 3
      result = "Almost certainly a vampire."
    elsif suspect == 4
      result = "Definitely a vampire."
    else
      result = "Results inconclusive."
  end

  # Last step: storing and sharing the final results
  puts result
  master_list.push(result)
  puts "Next!"
  i = i+1
end

puts "Here's your employee list recap:"
p master_list # For debugging
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends." #

# END
