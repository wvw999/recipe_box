require('spec_helper')

describe(Recipe) do
  describe('#amounts') do
    it('will create a recipe and multiple amounts') do
      recipe = Recipe.create({:title => "Ginger Cookie"})
      ingredient1 = recipe.ingredients.create({:ingredient_name => 'ginger'})
      ingredient2 = recipe.ingredients.create({:ingredient_name => 'molassas'})
      amount = recipe.amounts.create({:amount => "5", :ingredient_id => ingredient1.id})
      # expect(recipe.ingredients).to(eq([ingredient1, ingredient2]))
      expect(amount.recipe_id).to(eq(recipe.id))
      expect(amount.amount).to(eq('5'))
    end
  end

  describe('#tag') do
    it('a recipe can have many tags') do
      recipe = Recipe.create({:title => "pie"})
      tag1 = recipe.tags.create({:tag_name => "sweet"})
      tag2 = recipe.tags.create({:tag_name => "crusty"})
      expect(recipe.tags).to(eq([tag1, tag2]))
    end
  end

  describe('#amounts') do
    it('') do
      recipe = Recipe.create({:title => 'grasshopper grains'})
      ingredient = recipe.ingredients.create({:ingredient_name => 'wheat'})
      amount = Amount.all.last
      amount.update(amount: '2 cups')
      expect(recipe.amounts[0].amount).to include('2 cups')
    end
  end
end
