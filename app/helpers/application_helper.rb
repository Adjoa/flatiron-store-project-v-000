module ApplicationHelper
  def display_sign_in
    if !user_signed_in?
      content_tag(:li, link_to("sign in", new_user_session_path, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_signup
    if !user_signed_in?
      content_tag(:li, link_to("Sign up", new_user_registration_path, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_whoami
    if user_signed_in?
      content_tag(:li, "Signed in as #{current_user.email}", class: "nav-item") 
    end
  end
  
  def display_sign_out
    if user_signed_in?
      link_to "Sign out", destroy_user_session_path, method: :delete, :class => 'navbar-link'
    end
  end

  def current_cart
    Cart.find(current_user.current_cart_id)
  end

  def formatted_value(amount)
    number_to_currency(amount.to_f/100)
  end
end

