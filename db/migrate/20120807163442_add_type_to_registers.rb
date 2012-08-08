class AddTypeToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :type_document, :string
  end
end
