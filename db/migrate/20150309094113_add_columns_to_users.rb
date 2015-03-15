class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :uid
  end
end
