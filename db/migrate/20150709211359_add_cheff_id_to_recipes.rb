class AddCheffIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cheff_id, :integer
  end
end
