class Song < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :comments

  has_many :likes, as: :likeable, foreign_key: "likeable_id"
  validates :user_id, presence: true
  validates :file, presence: true
  validates :title, presence: true

  scope :hot_songs, -> {joins(:likes).group('songs.id').order('count(likes.id) desc').limit(10)}
end