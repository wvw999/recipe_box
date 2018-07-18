require('spec_helper')

describe(Ingredient) do
  describe('#recipe') do
    it('will create an ingredient and associate it with more than one recipe') do
      ingredient = Ingredient.create({:ingredient_name => 'lard'})
      recipe1 = ingredient.recipes.create({:title => 'biscuits'})
      recipe2 = ingredient.recipes.create({:title => 'tortillas'})
      expect(ingredient.recipes).to(eq([recipe1, recipe2]))
    end
  end
end
