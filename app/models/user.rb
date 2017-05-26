class User < ActiveRecord::Base
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  has_many :songs
  has_many :comments
  has_many :likes, foreign_key: "user_id"
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: true}
  validates :password, presence: true,
            confirmation: true,
            length: {in: 6..16},
            on: :create

  def to_param
    name
  end

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
