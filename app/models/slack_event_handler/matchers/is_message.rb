class SlackEventHandler::Matchers::IsMessage < SlackEventHandler::Matchers::Base
  def match?(event)
    event.message?
  end
end
