class CreateLineItems < ActiveRecord::Migration
  def change
  	create_table :line_items do |l|
 		l.integer :cart_id
 		l.integer :item_id
 		l.integer :quantity
  	end
  end
end