class User < ActiveRecord::Base
  include Clearance::User

  has_many :events

  before_validation :reset_password

  validates_numericality_of :points, :props, greater_than_or_equal_to: 0
  validates_presence_of :name, :points, :email, :props

  def self.find_by_slack_id(slack_id)
    client = Slack::RPC::Client.new(ENV.fetch("SLACK_API_TOKEN"))

    slack_user = client.users.list.body["members"].find do |slack_user|
      slack_user["id"] == slack_id
    end

    where(slack_username: slack_user["name"]).first
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
