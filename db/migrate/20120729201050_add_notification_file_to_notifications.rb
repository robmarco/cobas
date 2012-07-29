class AddNotificationFileToNotifications < ActiveRecord::Migration
  def change
  	add_attachment :notifications, :notification_file
  end
end
