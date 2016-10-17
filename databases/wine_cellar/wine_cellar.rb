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

# def update_code(database, year, variety, region, notes)
#   my_log.execute("INSERT INTO wine_cellar (year, variety, region, notes) VALUES (?, ?)", [year, variety, region, notes])
# end

# Creating a printout function:

def log_printer(database)
  my_database_printout = database.execute("SELECT * FROM wine_cellar") # Note that you don't need the semicolon?
  puts "\nHere is your database readout:"
  puts "="*30
  my_database_printout.each {|data_item| p data_item}
end

# DRIVER CODE:

my_log.execute(initialise_code)

# Playing around with insertion/deletion:

# my_log.execute("INSERT INTO wine_cellar (year, variety, region, notes) VALUES (2011, 'Red Blend', 'Central Coast', 'Very tasty')")
# my_log.execute("DELETE FROM wine_cellar WHERE year=2011")

log_printer(my_log)
