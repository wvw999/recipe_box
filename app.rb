require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/recipe')
require('./lib/amount')
require('./lib/ingredient')
require('./lib/tag')
require("pg")
require("pry")

get('/') do
  @recipes_list = Recipe.all()
  erb(:index)
end

post('/recipe') do
  recipe_title = params["title"]
  new_recipe = Recipe.create({:title => recipe_title})
  redirect '/'
end
