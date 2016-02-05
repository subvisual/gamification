class SlackEventHandler::Matchers::HasRegex < SlackEventHandler::Matchers::Base
  def match?(event)
    event.text.match(options[:regex])
  end
end
