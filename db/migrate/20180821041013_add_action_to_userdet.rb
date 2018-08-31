class AddActionToUserdet < ActiveRecord::Migration[5.2]
  def change
    add_column :userdets, :action, :boolean
  end
end
