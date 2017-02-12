class Picture < ActiveRecord::Base
  validates :content, :photo, presence: true

  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
