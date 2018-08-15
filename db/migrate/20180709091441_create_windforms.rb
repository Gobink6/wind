class CreateWindforms < ActiveRecord::Migration[5.2]
  def change
    create_table :windforms do |t|
      t.string :no
      t.string :user

      t.timestamps
    end
  end
end
