class CreateWindmills < ActiveRecord::Migration[5.2]
  def change
    create_table :windmills do |t|
      t.string :no
      t.string :windformid
      t.string :location

      t.timestamps
    end
  end
end
