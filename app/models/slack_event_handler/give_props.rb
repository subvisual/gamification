class SlackEventHandler
  class GiveProps < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasMention
    matcher Matchers::HasEmoji, emoji: :props

    def run
      return send_receiver_not_found unless receiver
      return send_sender_not_found unless sender
      return send_no_props unless sender.props > 0

      ActiveRecord::Base.transaction do
        sender.update!(props: sender.props - 1)
        EventCreator.new(action_slug: props_action.slug, user: receiver).call
      end

      send_success
    end

    private

    def receiver
      @_receiveer ||= event.mentioned_users.first
    end

    def sender
      @_sender ||= event.user
    end

    def props_action
      @_action ||= Action.where(slug: :props).first
    end

    def send_no_props
      send("It seems you do not have more props to give.")
    end

    def send_receiver_not_found
      send("Master, it seems the person you are trying to give props to does not exist in the database. Perhaps you can configure his slack username.")
    end

    def send_sender_not_found
      send("Master, it appears you are not in the database. Perhaps you need to configure your slack username.")
    end

    def send_success
      send("Splendid! One prop was given to #{receiver.name}.")
    end

    def send(text)
      event.reply(text)
    end
  end
end
