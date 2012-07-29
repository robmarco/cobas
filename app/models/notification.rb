class Notification < ActiveRecord::Base
  attr_accessible :date_notification, :description, :who, :notification_file
  has_attached_file :notification_file

  validates_presence_of :date_notification, :description, :who
end
