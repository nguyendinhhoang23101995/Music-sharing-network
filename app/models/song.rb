class Song < ActiveRecord::Base
  include SongsHelper
  mount_uploader :pic, PicUploader
  mount_uploader :file, FileUploader
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, as: :likeable, foreign_key: "likeable_id", dependent: :destroy
  validates :user_id, presence: true
  after_create :create_notification

  scope :hot_songs, -> {joins(:likes).
      group('songs.id').
      order('count(likes.id) desc').
      limit(10)}

  def create_notification
    at_users = User.all
    send_notification_to_at_users(at_users)
  end

  def send_notification_to_at_users(at_users)
    (Array.wrap(at_users) - [self.user]).each do |at_user|
      Notification.create(user: at_user, subject: self, name: 'song')
    end
  end

end