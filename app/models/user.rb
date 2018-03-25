class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'
  has_many :carts

  # attr_accessor :current_cart <- Passes the spec but does not persist our cart
  
  # current_user.current_cart = Cart.create.line_items.build(item_id: 1)
  def current_cart=(current_cart)# <- This may work
    self.carts << current_cart
  end
  
  def current_cart #<- This may also work
    Cart.find_by(:user_id => self.id, :status => nil)
  end

end
