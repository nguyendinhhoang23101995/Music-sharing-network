class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable
  validates :user_id, :likeable_id, :likeable_type, presence: true

end