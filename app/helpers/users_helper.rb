module UsersHelper
  def user_profile_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar
    else
      image_tag 'chomsky.jpeg'
    end
  end
end
