class AddTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kind, :integer, null: false, default: 0
  end
end
