class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :windmill_id
      t.string :log
      t.string :alaram_log

      t.timestamps
    end
  end
end
