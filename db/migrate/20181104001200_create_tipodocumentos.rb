class CreateTipodocumentos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipodocumentos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
