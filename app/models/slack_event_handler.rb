class SlackEventHandler
  HANDLERS = [
    SetUser,
    Unrecognized,
    GiveProps,
    ShowStatus,
    SaveAction,
    EndVacations,
    StartVacations,
  ].freeze

  def self.handle(event)
    handler = HANDLERS.find do |h|
      h.new(event).can_handle?
    end

    handler.new(event).run if handler
  end

  private
end
