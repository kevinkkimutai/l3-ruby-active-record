require "pry"
require "active_record"

# TODO: CONNECT TO THE DATABASE

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/school.db"
)

# TODO: CREATE TABLE
create_tm_table = <<-SQL
CREATE TABLE IF NOT EXISTS mentors (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    UNIQUE(email)
    )
    SQL

    ActiveRecord::Base.connection.execute(create_tm_table)

# TODO: Create class that associates with the db table
class Mentor < ActiveRecord::Base
end

# TODO: VIEW METHODS AVAILABLE FOR TABLE (methods)
# puts Mentor.methods

# TODO: COLUMN NAMES (column_names)
pp Mentor.column_names

# TODO: CREATE NEW RECORD (create)
# Mentor.create do |m|
#     m.name = "Rian C"
#     m.email = "rian@c.com"
# end

# TODO: VIEW ALL RECORDS (all)
Mentor.all.each do |m|
    puts m.name
end

# TODO: FIND BY ID (find)
pp Mentor.find(3)

# TODO: FIND BY GIVEN CONDITIONS (find_by)
pp Mentor.find_by(name: "Kevin Kirui")

# TODO: UPDATE RECORDS (save)
kevin = Mentor.find_by(name: "Kevin Kirui")
kevin.email = "kevin@e.com"
kevin.save
