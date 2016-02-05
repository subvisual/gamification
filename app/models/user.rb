class User < ActiveRecord::Base
  include Clearance::User

  has_many :events

  def first_name
    name.split.first
  end

  def position
    '1st'
  end

  def self.find_by_slack_id(slack_id)
    client = Slack::RPC::Client.new(ENV.fetch('SLACK_API_TOKEN'))

    slack_user = client.users.list.body["members"].find do |slack_user|
      slack_user["id"] == slack_id
    end

    where(slack_username: slack_user[:name]).first
  end
end
