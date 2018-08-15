class CreateStreams < ActiveRecord::Migration[5.2]
  def change
    create_table :streams do |t|
      t.string :windmillid
      t.string :ambi
      t.string :genonetemp
      t.string :gentwo
      t.string :nacel
      t.string :cntrl
      t.string :hydr
      t.string :gear
      t.string :bear
      t.string :windspeed

      t.timestamps
    end
  end
end
