class AddJoinToTagsAndRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table(:recipes_tags, id: false) do |t|
      t.belongs_to(:recipe, index: true)
      t.belongs_to(:tag, index: true)
    end
  end
end
