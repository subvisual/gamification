class Action < ActiveRecord::Base
  has_many :events

  validates_presence_of :slug, :name, :points
end
