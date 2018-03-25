class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  # attr_accessor :current_cart <- Passes the spec but does not persist our cart
  
  # def current_cart=(current_cart) <- This may work
  #   self.carts << current_cart
  # end
  
  # def current_cart <- This may also work
  #   Cart.where("status != ?", "submitted")
  # end

  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'

end
