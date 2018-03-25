module ApplicationHelper
  def display_sign_in
    if !current_user
      content_tag(:li, link_to("sign in", new_user_session_path))
    end
  end
  
  def display_signup
    if !current_user
       content_tag(:li, link_to("Sign up", new_user_registration_path))
    end
  end
end
