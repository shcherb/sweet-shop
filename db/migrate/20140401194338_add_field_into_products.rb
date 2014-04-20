class AddFieldIntoProducts < ActiveRecord::Migration
  def change
    add_column :products, :today_special, :boolean
  end
end
