class AddMobileTokenToUserdet < ActiveRecord::Migration[5.2]
  def change
    add_column :userdets, :mobile_token, :string
  end
end
