class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.integer :points, null: false

      t.timestamps null: false
    end
  end
end
