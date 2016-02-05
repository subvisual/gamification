class SlackEventHandler
  HANDLERS = [
    GiveProps,
    ShowStatus
  ].freeze

  def self.handle(data, client)
    slack_event = SlackEvent.new(data)

    HANDLERS.each do |handler|
      handler.new(slack_event, client).run_if_match
    end
  end
end
