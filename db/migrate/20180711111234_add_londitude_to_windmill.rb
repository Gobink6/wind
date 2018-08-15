class AddLonditudeToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :londitude, :string
  end
end
