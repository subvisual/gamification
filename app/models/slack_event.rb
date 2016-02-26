class SlackEvent
  MENTION_REGEX = /\<@[A-Z0-9]+\>/
  SLACK_ID_REGEX = /[A-Z0-9]+/
  EMOJI_REGEX = /:[^:\s]+:/

  def initialize(data, client)
    @data = data.with_indifferent_access
    @client = client
  end

  def text
    data[:text]
  end

  def user
    find_user_by_slack_id(data[:user])
  end

  def slack_username
    client.users[data[:user]]["name"]
  end

  def bot?
    client.self.name == slack_username
  end

  def reply(message)
    client.message(text: message, channel: channel)
  end

  def message?
    type == "message"
  end

  def mentions
    return [] unless text

    text.scan(MENTION_REGEX).map do |mention_str|
      mention_str.scan(SLACK_ID_REGEX).first
    end
  end

  def mentioned_users
    mentions.map { |slack_id| find_user_by_slack_id(slack_id) }
  end

  def emojis
    return [] unless text

    text.scan(EMOJI_REGEX).map do |emoji_str|
      emoji_str.gsub(':', '')
    end
  end

  private

  attr_reader :data, :client

  def type
    data[:type]
  end

  def channel
    data[:channel]
  end

  def find_user_by_slack_id(slack_id)
    user = client.users[slack_id]
    User.where(slack_username: user["name"]).first
  end
end
