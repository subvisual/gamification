class SlackEventHandler::Matchers::HasMention < SlackEventHandler::Matchers::Base
  def match?(event)
    event.mentions.any?
  end
end
