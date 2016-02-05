class SlackEventHandler::Matchers::HasEmoji < SlackEventHandler::Matchers::Base
  def match?(event)
    event.emojis.any? do |emoji|
      emoji == options[:emoji].to_s
    end
  end
end
