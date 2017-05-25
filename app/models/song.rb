class Song < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :comments
  validates :user_id, presence: true
end