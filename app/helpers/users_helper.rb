module UsersHelper
 def get_user_image_url(user)
    if user.image && user.image.url
       user.image.url
    else
     "fake_user.png"
    end
 end
end
