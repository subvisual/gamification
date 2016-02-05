class AddUserData < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.string :points, default: 0
    end
  end
end
