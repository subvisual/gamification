class SlackEventHandler::Matchers::HasRegex < SlackEventHandler::Matchers::Base
  def match?(event)
    event.text.downcase.match(options[:regex])
  end
end
