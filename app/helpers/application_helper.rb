module ApplicationHelper
  def stars(num_stars)
    return ((image_tag "star.jpg") * num_stars).html_safe
  end
  
  def is_admin? # boolean method with question mark at the end
    return current_user.try(:admin?)
  end
  
end
