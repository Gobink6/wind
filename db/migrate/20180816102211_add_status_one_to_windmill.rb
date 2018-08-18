class AddStatusOneToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :status_one, :string
  end
end
