class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |i|
  		i.string :title
  		i.integer :price
  		i.integer :inventory
  		i.integer :category_id
  	end
  end
end
