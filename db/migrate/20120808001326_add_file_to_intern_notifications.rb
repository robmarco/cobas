class AddFileToInternNotifications < ActiveRecord::Migration
  def change
  	add_attachment :intern_notifications, :intern_notification_file
  end
end
