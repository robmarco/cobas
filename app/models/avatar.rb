class Avatar < ActiveRecord::Base
  attr_accessible :avatar_content_type, :avatar_file_name, :avatar_file_size, 
  								:avatar_updated_at, :register_id, :avatar
  
  belongs_to :register

  has_attached_file :avatar, 
  	:path => "register_files/:id/:filename.:extension",
  	:storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  def dossier_id
  	self.register.dossier.id
  end

end
