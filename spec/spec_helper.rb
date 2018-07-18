ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('recipe')
require('amount')
require('ingredient')
require('tag')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all.each do |recipe|
      recipe.destroy()
    end
    Ingredient.all.each do |ingredient|
      ingredient.destroy()
    end
    Tag.all.each do |tag|
      tag.destroy()
    end
    Amount.all.each do |amount|
      amount.destroy()
    end
  end
end
