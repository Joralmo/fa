class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :mensaje
      t.string :idUsuario
      t.boolean :leida

      t.timestamps
    end
  end
end
