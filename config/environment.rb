require "bundler/setup"

require "sinatra/activerecord"
require 'ostruct'
require 'date'
require_relative '../app/models/costume.rb'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/costumes.sqlite"
)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS costumes (
  id INTEGER PRIMARY KEY,
  name TEXT,
  price REAL,
  image_url TEXT,
  size TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
  )
SQL

ActiveRecord::Base.connection.execute(sql)

sql2 = <<-SQL
  CREATE TABLE IF NOT EXISTS costume_stores (
  id INTEGER PRIMARY KEY,
  name TEXT,
  location TEXT,
  costume_inventory INTEGER,
  num_of_employees INTEGER,
  still_in_business BOOLEAN,
  opening_time TIMESTAMP,
  closing_time TIMESTAMP
  )
SQL

ActiveRecord::Base.connection.execute(sql2)

sql3 = <<-SQL
  CREATE TABLE IF NOT EXISTS haunted_houses (
  id INTEGER PRIMARY KEY,
  name TEXT,
  location TEXT,
  theme TEXT,
  price REAL,
  family_friendly BOOLEAN,
  opening_date TIMESTAMP,
  closing_date TIMESTAMP,
  description TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql3)
