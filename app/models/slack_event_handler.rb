class SlackEventHandler
  HANDLERS = [
    GiveProps,
    ShowStatus,
    SaveAction,
  ].freeze

  def self.handle(event, client)
    HANDLERS.each do |handler|
      handler.new(event, client).run_if_match
    end
  end
end
