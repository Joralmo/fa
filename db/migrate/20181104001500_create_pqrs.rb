class CreatePqrs < ActiveRecord::Migration[5.2]
  def change
    create_table :pqrs do |t|
      t.datetime :fecha
      t.string :descripcion
      t.string :archivo
      t.boolean :estado
      t.references :usuario, foreign_key: true
      t.references :dependencium, foreign_key: true
      t.string :respuesta

      t.timestamps
    end
  end
end
