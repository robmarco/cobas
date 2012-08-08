class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
