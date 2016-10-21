# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Me: adding a "contact" page that sends information:
get '/contact' do  # Note to self: that it's reading break code as HTML, not Ruby (i.e., you don't do \n but rather <br>)
  address = "<h4>Our Address:</h4><p>1600 J St., Suite A,</br>Washington, DC,</br>USA</p>"
  return address
end

# Me: Adding a query parameter and a conditional statment that works if the user has not inputted a name at all yet
# Try putting this into the browser: localhost:9393/great_job?person=Moi
get '/great_job' do
  p params[:good_person]
  if params[:good_person]
    result =  "Great job, #{params[:good_person]}!"
  else
    result = "Good job!"
  end
  return result
end
