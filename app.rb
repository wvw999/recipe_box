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
  @recipe = Recipe.create({:title => recipe_title})
  erb(:edit)
end

get('/recipes/:id/display') do
  @recipe = Recipe.find(params[:id].to_i)
  erb(:recipe)
end

patch('/recipes/:id/ingredient') do
  @recipe = Recipe.find(params[:id].to_i)
  new_ingredient = @recipe.ingredients.create({:ingredient_name => params["new_ingredient"]})
  @amount = Amount.find_by recipe_id: @recipe.id
  @amount.update(amount: params["amount"])
  # new_ingredient.amounts.create({:amount => params["amount"], :recipe_id => @recipe.id})
  erb(:edit)
end

patch('/recipes/:id/instructions') do
  @recipe = Recipe.find(params[:id])
  @recipe.update({:instructions => params["new_instructions"]})
  erb(:edit)
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params[:id])
  erb(:edit)
end

#
# post('/recipes/:id/remove') do
#
# end
