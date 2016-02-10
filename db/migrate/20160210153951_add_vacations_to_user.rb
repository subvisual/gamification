class AddVacationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :started_vacations_at, :datetime
  end
end
