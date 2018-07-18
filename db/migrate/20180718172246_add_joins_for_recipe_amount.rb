class AddJoinsForRecipeAmount < ActiveRecord::Migration[5.2]
  def change
    drop_table(:amounts)

    create_table(:amounts) do |t|
      t.belongs_to(:recipe, index: true)
      t.belongs_to(:ingredient, index: true)
      t.column(:amount, :string)
      t.timestamps
    end
  end
end
