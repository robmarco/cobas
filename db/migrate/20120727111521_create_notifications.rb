class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :who
      t.date :date_notification
      t.text :description

      t.timestamps
    end
  end
end
