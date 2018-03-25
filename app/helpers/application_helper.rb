module ApplicationHelper
  def display_sign_in
    if !current_user
      content_tag(:li, link_to("sign in", new_user_session_path, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_signup
    if !current_user
      content_tag(:li, link_to("Sign up", new_user_registration_path, class: "nav-link"), class: "nav-item")
    end
  end
  
  def display_whoami
    if current_user
      content_tag(:li, "Signed in as #{current_user.email}", class: "nav-item") 
    end
  end
end
