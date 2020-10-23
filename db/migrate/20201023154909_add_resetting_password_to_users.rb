class AddResettingPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :resetting_password, :boolean, default: false
  end
end
