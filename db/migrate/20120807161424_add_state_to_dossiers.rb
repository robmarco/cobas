class AddStateToDossiers < ActiveRecord::Migration
  def change
    add_column :dossiers, :state, :string
  end
end
