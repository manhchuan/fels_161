module UsersHelper
  def gravatar_for user
    image_tag user.avatar? ? user.avatar : "default.JPG", class: "mc-img"
  end
end
