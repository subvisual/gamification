class SlackEventHandler
  class EndVacations < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /(i am|i.m)/
    matcher Matchers::HasRegex, regex: /vacations/
    matcher Matchers::HasRegex, regex: /back/
    matcher Matchers::HasRegex, regex: /from/

    def run
      event.user.end_vacations
      event.reply("Wellcome back master. I hope you had a nice time!")
    end
  end
end
