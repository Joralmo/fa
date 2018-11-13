class CreateDependencia < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencia do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
