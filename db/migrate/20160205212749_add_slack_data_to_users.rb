class AddSlackDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_data, :jsonb
  end
end
