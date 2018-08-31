class AddColumnsToWindmill < ActiveRecord::Migration[5.2]
  def change
    add_column :windmills, :customer_name, :string
    add_column :windmills, :sf_no, :string
    add_column :windmills, :htfc_no, :string
    add_column :windmills, :village, :string
  end
end
