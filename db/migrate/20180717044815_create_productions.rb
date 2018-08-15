class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :windmill_id
      t.string :gen0_react
      t.string :gen1_react
      t.string :gen2_react
      t.string :prod_react
      t.string :gen0_activ
      t.string :gen1_activ
      t.string :gen2_activ
      t.string :prod_activ

      t.timestamps
    end
  end
end
