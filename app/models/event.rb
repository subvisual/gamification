class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :action

  before_validation :set_points

  validates_presence_of :points

  private

  def set_points
    self.points ||= action.points
  end
end
