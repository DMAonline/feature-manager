require 'flipper'
require 'flipper-api'
require_relative 'config/database'
require 'flipper/adapters/sequel'

sequel_adapter = Flipper::Adapters::Sequel.new
flipper = Flipper.new(sequel_adapter)

run Flipper::Api.app(flipper) { |builder|
  builder.map "/health_checks/check_alive" do
    run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["#{flipper.features.count}"]] }
  end
  builder.map "/health_checks/check_ready" do
    run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["#{flipper.features.count}"]] }
  end
}