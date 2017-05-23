class User < ActiveRecord::Base
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :songs, dependent: :delete_all
  has_many :comments, dependent: :destroy
  has_many :likes, foreign_key: "user_id", dependent: :destroy
  has_many :notifications, dependent: :delete_all
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: true}
  validates :password, presence: true,
            confirmation: true,
            length: {in: 6..16},
            on: :create

  #Find user by name
  def to_param
    name
  end

  #Like
  def liking?(likeable)
    likes.find_by(likeable)
  end

  def like!(type, id)
    likes.create!(likeable_type: type, likeable_id: id)
  end

  def unlike!(type, id)
    likes.find_by(likeable_type: type, likeable_id: id).destroy
  end
end
