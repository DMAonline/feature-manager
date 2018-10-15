require 'flipper'
require 'flipper-api'
require_relative 'config/database'
require 'flipper/adapters/sequel'

sequel_adapter = Flipper::Adapters::Sequel.new
flipper = Flipper.new(sequel_adapter)

run Flipper::Api.app(flipper)