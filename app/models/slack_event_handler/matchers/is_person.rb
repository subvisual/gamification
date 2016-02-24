class SlackEventHandler::Matchers::IsPerson < SlackEventHandler::Matchers::Base
  def match?(event)
    !event.bot?
  end
end
