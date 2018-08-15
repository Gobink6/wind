class AddLatitudeToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :latitude, :string
  end
end
