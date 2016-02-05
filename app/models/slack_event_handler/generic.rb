module SlackEventHandler::Generic
  extend ActiveSupport::Concern
  include MatcherList

  def initialize(event)
    @event = event
  end

  def run_if_match

    return unless match?(event)
    run
  end

  protected

  attr_reader :event
end
