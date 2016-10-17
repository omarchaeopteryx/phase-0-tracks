# Omar Malik
# DBC, Phase 0, Week 8.5

# LINKING SQL, RUBY, and ORM THROUGH A 'WINE-CELLAR' DATABASE

# LOGIC CODE:

# Requiring gems:
require 'sqlite3'
# require 'faker'n <-- Not necessary: using inputted data

# Creating a blank SQLite3 database:
my_log = SQLite3::Database.new("wine_cellar.db")
my_log.results_as_hash = true

# Initializing a blank "wine_cellar" log list:

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

def db_adder(database, year, variety, region, notes)
  database.execute("INSERT INTO wine_cellar (year,variety,region,notes) VALUES (?,?,?,?)", [year,variety,region,notes])
end

# Creating a series of "update value for an item" functions:

def db_update_item_year(database,updated_year,item_id)
  execution_code = "UPDATE wine_cellar SET year='#{updated_year}' WHERE id=#{item_id}" # REFACTOR?: The only thing changing in this list is the updated_* code bit!
  database.execute(execution_code)
end

def db_update_item_variety(database,updated_variety,item_id)
  execution_code = "UPDATE wine_cellar SET variety='#{updated_variety}' WHERE id=#{item_id}"
  database.execute(execution_code)
end

def db_update_item_region(database,updated_region,item_id)
  execution_code = "UPDATE wine_cellar SET region='#{updated_region}' WHERE id=#{item_id}"
  database.execute(execution_code)
end

def db_update_item_notes(database,updated_notes,item_id)
  execution_code = "UPDATE wine_cellar SET notes='#{updated_notes}' WHERE id=#{item_id}"
  database.execute(execution_code)
end

# Creating a "remove item" function:

def db_deleter(database, id)
  database.execute("DELETE FROM wine_cellar where id=#{id}")
end

# Creating a printout function:

def db_printer(database)
  my_database_printout = database.execute("SELECT * FROM wine_cellar") # Note that you don't need the semicolon!
  puts "\nHere is your current wine list:\n" + "="*30 + "\n\n"
  my_database_printout.each {|data_item| puts "Item No. #{data_item[0]}: #{data_item[1]} -- #{data_item[2]} -- #{data_item[3]} -- #{data_item[4]}"}
end

# DRIVER CODE:

my_log.execute(initialise_code)

# my_log.execute("INSERT INTO wine_cellar (year, variety, region, notes) VALUES (2011, 'Red Blend', 'Central Coast', 'Very tasty')") <-- Creating test datum

puts "\n"*20 + "*"*30 + "\nWelcome to your WineCellar!\n" + "*"*30

user_command = nil

until user_command == 3

  puts "\nPlease choose an option from below:\n\n1. View my wine list\n2. Change my wine list\n3. Exit\n\n"

  user_command = gets.chomp.to_i

  if user_command == 1
    puts "\nYou chose to view the list!\n"
    db_printer(my_log) # Run the printout function for the database made so far
    puts "\n"+ "-"*30 + "\n"

  elsif user_command == 2 # Ask user for more information regarding the wine item
    puts "\nYou chose to change the list!\n"
    db_printer(my_log)
    puts "\n"+ "-"*30 + "\n"

    until user_command == 4
    puts "\nHere are your options:\n\n1. Add an item\n2. Update an item\n3. Remove an item\n4. Return\n\n"

    user_command = gets.chomp.to_i

      if user_command == 1
        puts "\nWhat year would you like to add?\n\n"
        new_year = gets.chomp.to_i
        puts "\nWhat grape variety is the wine?\n\n"
        new_variety = gets.chomp
        puts "\nWhat region is the wine from?\n\n"
        new_region = gets.chomp
        puts "\nWhat tasting notes do you have to add?\n\n"
        new_notes = gets.chomp
        # p [new_year, new_variety, new_region, new_notes] <-- Test code
        # Run some sort of INSERT function here... <-- Pseudocode
        db_adder(my_log,new_year,new_variety,new_region,new_notes)

      elsif user_command == 2
        puts "\nWhich Item Number do you want to update?\n\n"
        updated_item_no = gets.chomp.to_i
        puts "\nOK. You have chosen to update Item #{updated_item_no}...\n\n"

        # Now creating a sub-menu where we can change the attribute of a given row/item specifically....

        until user_command == 5  # Adding a series of SQL update functions:
          puts "\n\Which value for Item #{updated_item_no} would you like to update?\n\n1. Year\n2. Variety\n3. Region\n4. Notes\n5. Return\n\n"

          updated_item_value = gets.chomp # Note that this is a string...OK?

          if updated_item_value == ("1" || "Year" || "year")
            puts "\nWhat do you want to change Year to?\n\n"
            my_updated_year = gets.chomp
            db_update_item_year(my_log,my_updated_year,updated_item_no)
            puts "\nYou have successfully changed the year.\n\n"

          elsif updated_item_value == ("2" || "Variety" || "variety")
            puts "\nWhat do you want to change Variety to?\n\n"
            my_updated_variety = gets.chomp
            db_update_item_variety(my_log,my_updated_variety,updated_item_no)
            puts "\nYou have changed the variety.\n\n"

          elsif updated_item_value == ("3" || "Geography" || "geography")
            puts "\nWhat do you want to change Region to?\n\n"
            my_updated_region = gets.chomp
            db_update_item_region(my_log,my_updated_region,updated_item_no)
            puts "\nYou have changed the regional geography.\n\n"

          elsif updated_item_value == ("4" || "Notes" || "notes")
            puts "\nWhat do you want to change Notes to?\n\n"
            my_updated_notes = gets.chomp
            db_update_item_notes(my_log,my_updated_notes,updated_item_no)
            puts "\nYou have changed the notes.\n\n"

          elsif updated_item_value == ("5" || "Return" || "return")
            break
          else
            puts "\nI didn't get that...\n\n"
          end
        end

      elsif user_command == 3
        puts "\nWhich item would you like to delete?\n\n"
        deleted_item_no = gets.chomp.to_i
        puts "\nOK. Item #{deleted_item_no} has been deleted!\n"
        # Run some sort of DELETE function here...
        db_deleter(my_log,deleted_item_no)

      elsif user_command == 4
        break

      else
        puts "\nI didn't get that...\n\n" # <-- For error scenariors
      end

      end

  elsif user_command == 3
    puts "\nGoodbye!\n"

  else
    puts "\nI didn't understand that...\n\n" # <-- For error scenarios
  end
end

# Making a playful closing message:
puts "

  =--------------
|      |AU    |   \\ ----- =
|      |REVOIR|     ______ |  Thank you for using WineCellar!
  _______________ /

"

# Playing around with insertion/deletion: <-- Test code
# my_log.execute("DELETE FROM wine_cellar WHERE year=2011")
