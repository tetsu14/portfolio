module UsersHelper
	def image_for(user)
    if user.user_image
      image_tag "/user_images/#{user.user_image}", class: "profile_img"
    else
      image_tag "justin.jpg", class: "profile_img"
    end
  end
  
end
