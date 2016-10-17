# Omar Malik
# DBC, Phase 0, Week 8.5

# LINKING SQL, RUBY, and ORM THROUGH A WINE-CELLAR DATABASE

# LOGIC CODE:

# Requiring gems:
require 'sqlite3'
require 'faker'

# Creating a blank SQLite3 database:
my_log = SQLite3::Database.new("wine_cellar.db")
my_log.results_as_hash = true

# Initializing a blank wine cellar log list:

initialise_code = <<-QQQ
CREATE TABLE IF NOT EXISTS wine_cellar(
  id INTEGER PRIMARY KEY,
  year INT,
  variety VARCHAR(255),
  region VARCHAR(255),
  notes VARCHAR(255)
)
QQQ

# Creating an "add item" function:

# def db_adder(database)
#   database.execute("INSERT INTO wine_cellar ")
# end
# def update_code(database, year, variety, region, notes)
#   my_log.execute("INSERT INTO wine_cellar (year, variety, region, notes) VALUES (?, ?)", [year, variety, region, notes])
# end

# Creating a printout function:

def log_printer(database)
  my_database_printout = database.execute("SELECT * FROM wine_cellar") # Note that you don't need the semicolon
  puts "\nHere is your database readout:"
  puts "="*30
  my_database_printout.each {|data_item| puts "Item No. #{data_item[0]}: #{data_item[1]} -- #{data_item[2]} -- #{data_item[3]} -- #{data_item[4]}"}
end

# DRIVER CODE:

my_log.execute(initialise_code)

# my_log.execute("INSERT INTO wine_cellar (year, variety, region, notes) VALUES (2011, 'Red Blend', 'Central Coast', 'Very tasty')")

puts "\nWelcome to the WineCellar!\n"

user_command = nil
user_is_done_final = false
user_is_done_changing = false

until user_is_done_final == true

  puts "\n\nPlease choose an option from below:\n1. View my wine list\n2. Change my wine list\n3. Exit"

  user_command = gets.chomp.to_i

  if user_command == 1
    puts "You chose to view the list!"
    log_printer(my_log) # Run the printout function for the database made so far
  elsif user_command == 2 # Ask user for more information regarding the wine item
    puts "You chose to change the list!"
    log_printer(my_log)

    until
    puts "\n\nHere are your options:\n1.Add an item\n2.Update an item\n3.Remove an item\n4.Return"

    user_command = gets.chomp.to_i

    # done_with_updating = false
    # until done_with_updating == true

      if user_command == 1
        puts "What year would you like to add?"
        new_year = gets.chomp
        puts "What grape variety is the wine?"
        new_variety = gets.chomp
        puts "What region is the wine from?"
        new_region = gets.chomp
        puts "What tasting notes do you have to add?"
        new_notes = gets.chomp
        p [new_year, new_variety, new_region, new_notes]
        # Run some sort of INSERT function here...

      elsif user_command == 2
        puts "Which item number do you want to update?"
        updated_item_no = gets.chomp.to_i
        puts "OK. You have chosen to update Item #{updated_item_no}..."

        # Now creating a sub-menu where we can change the attribute of a given row/item specifically....

        until user_is_done_changing == true
          puts "\n\nWhat value do you want to update?\n1.Year\n2.Variety\n3.Geography\n4.Notes\n5.Return"

          updated_item_value = gets.chomp

          if updated_item_value == ("1" || "Year" || "year")
            puts "You have changed the year."

          elsif updated_item_value == ("2" || "Variety" || "variety")
            puts "You have changed the variety."

          elsif updated_item_value == ("3" || "Geography" || "geography")
            puts "You have changed the geography."

          elsif updated_item_value == ("4" || "Notes" || "notes")
            puts "You have changed the notes."

          elsif updated_item_value == ("5" || "Return" || "return")
            break
          else
            puts "I didn't get that--"
          end

          puts "Are you done updating (Y/N)?"

          if gets.chomp.upcase == ("Y" || "YES")
            user_is_done_changing = true

          else
            user_is_done_changing = false

          end
          p updated_item_no
          # ENDING THE UNTIL LOOP
        end
        # Run some sort of UPDATE function here...

      elsif user_command == 3
        puts "Which item would you like to delete?"
        deleted_item_no = gets.chomp.to_i
        puts "OK. Item #{deleted_item_no} has been deleted!"
        p updated_item_no
        # Run some sort of DELETE function here...

      elsif user_command == 4
        break

      else
        puts "I didn't get that..."
      end

      end

  elsif user_command == 3
    puts "Goodbye!"
    user_is_done_final = true

  else
    puts "I didn't quite understand that..."
  end
end

puts "Thank you for using WineCellar."

# Playing around with insertion/deletion:

# my_log.execute("DELETE FROM wine_cellar WHERE year=2011")
