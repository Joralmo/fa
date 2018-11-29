class CreateAuditoria < ActiveRecord::Migration[5.2]
  def change
    create_table :auditoria do |t|
      t.string :mensaje

      t.timestamps
    end
  end
end
