class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha
      t.integer :eNino
      t.integer :eAdulto
      t.integer :eAMayor
      t.integer :tNino
      t.integer :tAdulto
      t.integer :tAMayor
      t.integer :total
      t.string :notas

      t.timestamps
    end
  end
end
