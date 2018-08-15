class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :emailid
      t.string :phone
      t.string :role
      t.string :windformid

      t.timestamps
    end
  end
end
