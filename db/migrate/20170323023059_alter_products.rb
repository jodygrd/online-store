class AlterProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :price, :decimal, precision: 7, scale: 2
  	remove_column :products, :image, :string
  	add_column :products, :supplier_id, :integer

  end
end
