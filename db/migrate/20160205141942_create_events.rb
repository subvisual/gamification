class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, null: false
      t.references :action, null: false
      t.integer :points, null: false

      t.timestamps null: false
    end
  end
end
