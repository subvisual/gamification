class SlackEventHandler
  class ShowStatus
    include Generic

    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /status/

    def run
      puts @event
      puts status
      client.send({ type: status, text: "Trinta", channel: event.channel })
    end

    private

    def status
      User.all.map do |user|
        "#{user.name} has #{user.points}" 
      end.join("\n")
    end
  end
end
