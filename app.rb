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
  @all_tags = Tag.all
  # @recipe_tags = Recipe.tags
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

get('/recipes/:id/display') do
  @recipe = Recipe.find(params[:id].to_i)
  @recipe_ingredients = @recipe.ingredients
  @all_tags = Tag.all
  @recipe_tags = @recipe.tags
  erb(:recipe)
end

patch('/recipes/:id/ingredient') do
  @recipe = Recipe.find(params[:id].to_i)
  new_ingredient = @recipe.ingredients.create({:ingredient_name => params["new_ingredient"]})
  @amount = Amount.all.last
  @amount.update(amount: params["amount"])
  @all_tags = Tag.all
  @recipe_tags = @recipe.tags
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

patch('/recipes/:id/instructions') do
  @recipe = Recipe.find(params[:id])
  @recipe.update({:instructions => params["new_instructions"]})
  @all_tags = Tag.all
  @recipe_tags = @recipe.tags
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

post('/recipes/:id/tags/new') do
  @recipe = Recipe.find(params[:id].to_i)
  tag_name = params["new_tag"]
  new_tag = @recipe.tags.create({:tag_name => tag_name})
  @recipe_tags = @recipe.tags
  @all_tags = Tag.all
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

post('/recipe/:id/tag') do
  @recipe = Recipe.find(params[:id].to_i)
  @recipe_tags = @recipe.tags
  add_tag = params["tags_drop"]
  @recipe.tags.find_or_create_by({:tag_name => add_tag})
  @all_tags = Tag.all
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params[:id].to_i)
  @all_tags = Tag.all
  @recipe_tags = @recipe.tags
  @recipe_ingredients = @recipe.ingredients
  erb(:edit)
end

delete('/recipes/:id/remove') do
  @recipe = Recipe.find(params[:id])
  @recipe.destroy
  redirect '/'
end
