class SlackEventHandler
  class StartVacations < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /(i am|i.m)/
    matcher Matchers::HasRegex, regex: /on vacations/

    def run
      event.user.start_vacations
      event.reply("Auf Wiedersehen master. Have a great time!")
    end
  end
end
