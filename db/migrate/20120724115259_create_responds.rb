class CreateResponds < ActiveRecord::Migration
  def change
    create_table :responds do |t|
      t.date :date_respond
      t.text :description
      t.string :number_quit
      t.integer :register_id

      t.timestamps
    end
  end
end
