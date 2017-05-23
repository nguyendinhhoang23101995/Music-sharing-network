class User < ActiveRecord::Base
  authenticates_with_sorcery!
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
end
