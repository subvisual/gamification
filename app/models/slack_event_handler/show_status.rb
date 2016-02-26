class SlackEventHandler
  class ShowStatus < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /(status|game|board)/

    def run
      event.reply(status)
    end

    private

    def status
      User.order(points: :desc).all.map do |user|
        "#{user.name} has #{user.points} points and #{user.props} props available."
      end.join("\n")
    end
  end
end
