#Require Gems
require 'pry'
require 'open-uri'
require 'json'
require 'net/http'
require 'httparty'
require 'bundler'

#Bundler.require(:default)
#Require necessary files

require_relative './recipe_finder/api.rb'
require_relative './recipe_finder/cli.rb'
require_relative './recipe_finder/recipe_list.rb'
require_relative './recipe_finder/recipe.rb'

