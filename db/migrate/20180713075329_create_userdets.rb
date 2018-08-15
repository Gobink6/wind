class CreateUserdets < ActiveRecord::Migration[5.2]
  def change
    create_table :userdets do |t|
      t.string :usid
      t.string :windmill

      t.timestamps
    end
  end
end
