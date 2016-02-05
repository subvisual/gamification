class SlackEventHandler::Matchers::Base
  def initialize(options = {})
    @options = options
  end

  private

  attr_reader :options
end
