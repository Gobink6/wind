class AddPassToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :registers, :password, :string
  end
end
