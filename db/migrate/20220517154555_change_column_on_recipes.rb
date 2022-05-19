class ChangeColumnOnRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :public_recipe, :boolean, default:false
  end
end
