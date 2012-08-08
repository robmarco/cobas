class InternNotification < ActiveRecord::Base
  attr_accessible :date_intern, :description, :who, :intern_notification_file

  has_attached_file :intern_notification_file

  validates_presence_of :date_intern, :description, :who
end
