class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :action

  before_create :set_points

  private

  def set_points
    self.points ||= action.points
  end
end
