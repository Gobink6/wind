class CreateAlarmlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :alarmlogs do |t|
      t.string :windmillid
      t.string :timestamp
      t.string :alarmlog

      t.timestamps
    end
  end
end
