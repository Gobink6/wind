class AddStatusToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :status, :string
  end
end
