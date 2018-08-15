class CreateHoursecounts < ActiveRecord::Migration[5.2]
  def change
    create_table :hoursecounts do |t|
      t.string :windmillid
      t.string :timestamp
      t.string :total
      t.string :lineok
      t.string :turbineok
      t.string :run
      t.string :genone
      t.string :gentwo
      t.string :ambient
      t.string :line
      t.string :yawing
      t.string :service
      t.string :disp

      t.timestamps
    end
  end
end
