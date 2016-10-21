# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do  # Note to self: visit http://localhost:9393/?name=Yunus&age=55
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

# NEWs: Adding a "contact" page that sends information:
get '/contact' do  # Note to self: that it's reading break code as HTML, not Ruby (i.e., you don't do \n but rather <br>)
  address = "<h4>Our Address:</h4><p>1600 J St., Suite A,</br>Washington, DC,</br>USA</p><iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3104.989759451291!2d-77.03859778958464!3d38.90134949421302!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b7b7be81a5f503%3A0xa56258cd2bbc2c57!2sDowntown%2C+Washington%2C+DC+20005!5e0!3m2!1sen!2sus!4v1477010035702' width='300' height='225' frameborder='0' style='border:0'></iframe>"
  return address
end

# NEW: Adding a query parameter and a conditional statment that works if the user has not inputted a name at all yet
# Try putting this into the browser: localhost:9393/great_job?good_person=Moi
get '/great_job' do
  p params[:good_person]
  if params[:good_person]
    result =  "Great job, #{params[:good_person]}!"
  else
    result = "Good job!"
  end
  return result
end

# NEW: Adding a way to add two values and return the result:
get '/:first/plus/:second' do
  first_value = params[:first]; second_value = params[:second]
  total_value = (first_value.to_i + second_value.to_i) # <-- ii. But this did
  # total_value = first_value + second_value <-- i. This didn't work...
  "#{params[:first]} plus #{params[:second]}
  <br><br>equals<br><br>#{total_value}"
end

# OPTIONAL BONUS: Make a way to search/query the database
# RETURN TO THIS
get '/query' do
  my_query = params[:query_name] # So user can input ?query_name=
  students = db.execute("SELECT * FROM students WHERE name=#{my_query}")
  return students
end

# RESEARCH:

# 1. Is Sinatra the only Ruby library?
# No, there are other libraries out there. A popular one, for example, is Rails.
# Other names appearing in my searches are Lotus, Cuba, Padrino. See more at: https://blog.codeship.com/a-survey-of-non-rails-frameworks-in-ruby-cuba-sinatra-padrino-lotus/

# 2. What are other database options besides sqlite3?
# There are other relational databses out there available in gems, such as the MySQL gem, `mysql2`, and the PostgreSQL gem, `pg`.

# 3. What is meant by Web Stack?
# The phrase "Web stack" referes to the whole suite of software required to get a viable website up and running, including, but not limited to: the source code for the operating system, the database code, the web hosting services. E.g., the collection of tools we used to get the Ruby Web App up and running in DBC!
