class User < ActiveRecord::Base
  include Clearance::User

  has_many :events

  before_validation :reset_password

  validates_numericality_of :points, :props, greater_than_or_equal_to: 0
  validates_presence_of :name, :points, :email, :props

  def start_vacations
    update(started_vacations_at: DateTime.now)
    save
  end

  def end_vacations
    update(started_vacations_at: nil)
    save
  end

  def on_vacations?
    started_vacations_at.present?
  end

  def self.find_or_create_from_headquarters(info)
    where(email: info.email).first_or_initialize.tap do |user|
      user.update_attributes(email: info.email)
    end
  end

  private

  def reset_password
    return if persisted?

    require "securerandom"
    self.password = SecureRandom.hex(8)
  end
end
