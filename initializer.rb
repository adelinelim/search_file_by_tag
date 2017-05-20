# require "rubygems"
# require "bundler/setup"
require "active_support/all"
require "optparse"
require "pry"

# gem "pry-byebug"
# gem "pry-rails"

Dir[File.dirname(__FILE__) + "/setting/*.rb"].each do |file|
  require_relative file
end

Dir[File.dirname(__FILE__) + "/new_search/*.rb"].each do |file|
  require_relative file
end

Dir[File.dirname(__FILE__) + "/new_search/visitors/*.rb"].each do |file|
  require_relative file
end
