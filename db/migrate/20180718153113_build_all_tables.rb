class BuildAllTables < ActiveRecord::Migration[5.2]
  def change
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:rating, :integer)
      t.column(:instructions, :string)
      t.column(:tag_id, :integer)
      t.timestamps
    end

    create_table(:tags) do |t|
      t.column(:tag_name, :string)
      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:ingredient_name, :string)
      t.timestamps
    end

    create_table(:amounts) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:amount, :string)
      t.timestamps
    end
  end
end
