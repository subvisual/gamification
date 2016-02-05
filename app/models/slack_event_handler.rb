class SlackEventHandler
  HANDLERS = [
    GiveProps
  ]

  def self.handle(data)
    slack_event = SlackEvent.new(data)

    HANDLERS.each do |handler|
      handler.new(slack_event).run_if_match
    end
  end
end
