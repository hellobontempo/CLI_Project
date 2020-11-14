require 'bundler'
Bundler.require
require 'dotenv/load'

require_relative './recipe_finder/api.rb'
require_relative './recipe_finder/cli.rb'
require_relative './recipe_finder/custom_error.rb'
require_relative './recipe_finder/recipe.rb'

#Require Gems
# require 'pry'
# require 'open-uri'
# require 'json'
# require 'net/http'
# require 'httparty'


