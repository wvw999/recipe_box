class BuildAllTables < ActiveRecord::Migration[5.2]
  def change
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:rating, :integer)
      t.column(:instructions, :string)
      t.timestamps
    end

    create_table(:tags) do |t|
      t.column(:tag_name, :string)
    end

    create_table(:ingredients) do |t|
      t.column(:ingredient_name, :string)
    end
  end
end
