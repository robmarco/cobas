class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.text :who
      t.date :date_register
      t.text :description
      t.string :number_enter
      t.integer :time_respond

      t.timestamps
    end
  end
end
