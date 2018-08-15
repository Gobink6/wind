class CreateLogbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :logbooks do |t|
      t.string :windmillid
      t.string :timestamp
      t.string :logbook
      t.string :alaram_log

      t.timestamps
    end
  end
end
