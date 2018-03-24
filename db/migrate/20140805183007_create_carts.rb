class CreateCarts < ActiveRecord::Migration
  def change
  	create_table :carts do |c|
  		c.integer :user_id
  	end
  end
end
