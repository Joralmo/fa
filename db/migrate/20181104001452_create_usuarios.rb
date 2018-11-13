class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :celular
      t.references :rol, foreign_key: true
      t.references :dependencium, foreign_key: true
      t.string :email
      t.references :tipodocumento, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
    add_index :usuarios, :email, unique: true
  end
end
