class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :windmillid
      t.string :status
      t.string :power
      t.string :gen
      t.string :frequency
      t.string :rotor
      t.string :wind
      t.string :pitch

      t.timestamps
    end
  end
end
