class SlackEventHandler
  HANDLERS = [
    GiveProps,
    ShowStatus,
    SaveAction,
  ].freeze

  def self.handle(event)
    HANDLERS.each do |handler|
      handler.new(event).run_if_match
    end
  end
end
