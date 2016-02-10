class SlackEventHandler::Base
  extend ActiveSupport::Concern

  def initialize(event, client)
    @event = event
    @client = client
  end

  def run_if_match
    return unless match?(event)
    run
  end

  protected

  attr_reader :event, :client
end
