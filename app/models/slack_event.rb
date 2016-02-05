class SlackEvent
  MENTION_REGEX = /\<@[A-Z0-9]+\>/
  SLACK_ID_REGEX = /[A-Z0-9]+/
  EMOJI_REGEX = /:[^:]+:/

  def initialize(data)
    @data = data.with_indifferent_access
  end

  def type
    data[:type]
  end

  def text
    data[:text]
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

  def emojis
    return [] unless text

    text.scan(EMOJI_REGEX).map do |emoji_str|
      emoji_str.gsub(':', '')
    end
  end

  private

  attr_reader :data
end
