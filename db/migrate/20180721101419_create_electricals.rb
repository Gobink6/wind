class CreateElectricals < ActiveRecord::Migration[5.2]
  def change
    create_table :electricals do |t|
      t.string :data
      t.string :windmillid
      t.string :power
      t.string :cosphi
      t.string :frequency
      t.string :l1v
      t.string :l2v
      t.string :l3v
      t.string :l1a
      t.string :l2a
      t.string :l3a

      t.timestamps
    end
  end
end
