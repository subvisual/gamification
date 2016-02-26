class SlackEventHandler::Base
  extend ActiveSupport::Concern

  def initialize(event)
    @event = event
  end

  def can_handle?
    match?(event)
  end

  def run
    run
  end

  protected

  attr_reader :event
end
