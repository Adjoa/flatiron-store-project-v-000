class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items
	# belongs_to :current_cart, class_name: "User", foreign_key: 'user_id'

	def total
		sum = 0
		line_items.each do |l|
			sum += (l.quantity * l.item.price)
		end
		sum
	end

	def add_item(item_id)
		if LineItem.exists?(:cart_id => self.id, :item_id => item_id)
			# binding.pry
			line_item = LineItem.find_by(:item_id => item_id, :cart_id => self.id)

			# line_item.quantity += 1
			line_item.update(:quantity => (line_item.quantity + 1))
		else
			# line_item = LineItem.new(:item_id => item_id)
			line_item = line_items.build(:item_id => item_id, :quantity => 1)
		end
		line_item
	end
end
