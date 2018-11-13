class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.datetime :fecha
      t.string :comentario
      t.string :depactual
      t.string :depanterior
      t.references :pqr, foreign_key: true

      t.timestamps
    end
  end
end
