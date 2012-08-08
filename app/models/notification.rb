class Notification < ActiveRecord::Base
  attr_accessible :date_notification, :description, :who, :notification_file
  
  has_attached_file :notification_file,
  	:path => "notifications_files/:id/:filename.:extension",
  	:storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates_presence_of :date_notification, :description, :who
end
