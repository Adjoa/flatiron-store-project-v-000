class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		line_items.map {|l| l.quantity * l.item.price}.reduce(:+)
	end

	def add_item(item_id)
		if LineItem.exists?(:cart_id => self.id, :item_id => item_id)
			line_item = LineItem.find_by(:item_id => item_id, :cart_id => self.id)
			line_item.update(:quantity => (line_item.quantity + 1))
		else
			line_item = line_items.build(:item_id => item_id, :quantity => 1)
		end
		line_item
	end
end
