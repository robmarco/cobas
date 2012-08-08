class CreateInternNotifications < ActiveRecord::Migration
  def change
    create_table :intern_notifications do |t|
      t.date :date_intern
      t.string :who
      t.text :description

      t.timestamps
    end
  end
end
