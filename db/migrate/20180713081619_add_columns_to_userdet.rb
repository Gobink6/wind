class AddColumnsToUserdet < ActiveRecord::Migration[5.2]
  def change
    add_column :userdets, :windfrom, :string
  end
end
