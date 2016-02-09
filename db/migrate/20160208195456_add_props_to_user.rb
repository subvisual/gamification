class AddPropsToUser < ActiveRecord::Migration
  def change
    add_column :users, :props, :integer, default: 0, null: false
  end
end
