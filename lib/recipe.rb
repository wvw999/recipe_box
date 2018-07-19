class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :amounts
  has_many :ingredients, through: :amounts
  validates(:title, {:presence => true, :uniqueness => true})

  def recipe_with_amount(recipe_id)
    # end with array of arrays: [[ingredient, amount], [ingredient2, amount2], [etc]]
    @ingredients_amounts = []
    # list of ingredientes -> list of amounts. Then put together
    recipe = Recipe.find(recipe_id)
    @ingredient_list = recipe.ingredients
    @ingredient_list.each do |ingredient|
      ingredient_amount = []
      ingredient_amount.push(ingredient.ingredient_name)
      ingredient_amount.push((Amount.find_by(recipe_id: recipe.id, ingredient_id: ingredient.id)).amount)
      @ingredients_amounts.push(ingredient_amount)
    end
    @ingredients_amounts
  end
end
