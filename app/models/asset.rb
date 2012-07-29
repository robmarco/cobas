class Asset < ActiveRecord::Base
  attr_accessible :asset_content_type, :asset_file_name, :asset_file_size, :asset_updated_at, :respond_id, :asset

  belongs_to :respond
  
  has_attached_file :asset
end
