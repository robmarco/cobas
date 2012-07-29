class Avatar < ActiveRecord::Base
  attr_accessible :avatar_content_type, :avatar_file_name, :avatar_file_size, 
  								:avatar_updated_at, :register_id, :avatar
  
  belongs_to :register

  has_attached_file :avatar
end
