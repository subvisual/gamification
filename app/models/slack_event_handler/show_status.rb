class SlackEventHandler
  class ShowStatus
    include Generic

    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /status/

    def run
      client.send(type: "message", text: status, channel: event.channel)
    end

    private

    def status
      User.order(points: :desc).all.map do |user|
        "#{user.name} has #{user.points} points"
      end.join("\n")
    end
  end
end
