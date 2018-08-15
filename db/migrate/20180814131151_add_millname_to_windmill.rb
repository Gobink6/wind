class AddMillnameToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :name, :string
  end
end
