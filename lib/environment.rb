require 'bundler'
Bundler.require

require 'dotenv/load'

require_relative './recipe_finder/api.rb'
require_relative './recipe_finder/cli.rb'
require_relative './recipe_finder/recipe.rb'