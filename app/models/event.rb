class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :action

  before_validation :set_points

  validates_presence_of :points

  default_scope { order("created_at DESC") }

  private

  def set_points
    self.points ||= begin
      if action
        action.points
      end
    end
  end
end
