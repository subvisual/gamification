class SlackEventHandler
  class GiveProps
    include Generic

    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasMention
    matcher Matchers::HasEmoji, emoji: :props

    def run
      receiver = User.find_by_slack_id(event.mentions.first)
      return unless receiver

      EventCreator.new(action_slug: :props, user: receiver)
      client.send(text: "Quarenta!", channel: event.channel, type: "message")
    end
  end
end
