class User < ActiveRecord::Base

  has_many :activities, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :name, presence: true, length:{maximum: 30}
  validates :email, presence: true, length:{maximum: 50}
  validates :password, presence: true, length:{minimum: 6}

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end
  
  def current_user? user
    self == user
  end
end
