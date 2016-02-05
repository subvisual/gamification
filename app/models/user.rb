class User < ActiveRecord::Base
  include Clearance::User

  has_many :events

  def first_name
    name.split.first
  end

  def position
    '1st'
  end

  def titles
    'O cêpo'
  end
end
