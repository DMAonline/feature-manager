require_relative '../config/database.rb'
require 'generators/flipper/templates/sequel_migration'

CreateFlipperTablesSequel.new(Sequel::Model.db).up