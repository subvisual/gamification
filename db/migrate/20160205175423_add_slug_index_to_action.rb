class AddSlugIndexToAction < ActiveRecord::Migration
  def change
    add_index :actions, :slug, unique: true
  end
end
