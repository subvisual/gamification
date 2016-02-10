class SlackEventHandler
  HANDLERS = [
    GiveProps,
    ShowStatus,
    SaveAction,
    EndVacations,
    StartVacations,
  ].freeze

  def self.handle(event)
    HANDLERS.each do |handler|
      handler.new(event).run_if_match
    end
  end
end
