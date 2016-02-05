class SlackEventHandler
  class GiveProps
    include Generic

    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasMention
    matcher Matchers::HasEmoji, emoji: :props

    def run
       # TODO
    end
  end
end
