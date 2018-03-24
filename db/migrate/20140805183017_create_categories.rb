class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |c|
  		c.string :title
  	end
  end
end
