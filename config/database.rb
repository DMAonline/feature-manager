require 'sequel'

connection_string = ENV['MYSQL_CONNECTION_STRING']

DB = Sequel.connect(connection_string)

Sequel.extension :migration