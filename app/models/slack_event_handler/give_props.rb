class SlackEventHandler
  class GiveProps
    include Generic

    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasMention
    matcher Matchers::HasEmoji, emoji: :props

    def run
      receiver = User.find_by_slack_id(event.mentions.first)
      props_action = Action.where(slug: :props).first

      return unless receiver

      ActiveRecord::Base.transaction do
        receiver.events.create(action: props_action, points: props_action.points)
        receiver.increment!(:points, props_action.points)
      end

      client.send(text: "Quarenta!", channel: event.channel, type: "message")
    end
  end
end
