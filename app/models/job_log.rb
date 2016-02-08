class JobLog < ActiveRecord::Base
  scope :for_name, ->(name) { where(name: name).order(created_at: :desc) }

  validates_presence_of :name
end
