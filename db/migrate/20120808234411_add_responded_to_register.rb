class AddRespondedToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :responded, :boolean, :default => false
  end
end
