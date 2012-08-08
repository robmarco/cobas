class AddDossierIdToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :dossier_id, :integer
  end
end
