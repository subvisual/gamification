class JobLog < ActiveRecord::Base
  scope :for_name, ->(name) { where(name: name).order(created_at: :desc) }
end
