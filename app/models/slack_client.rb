class SlackClient
  def initialize(client, event)
    @client = client
    @event = event
  end

  def send_message(message)
    client.send(text: message, channel: event.channel, type: "message")
  end

  private

  attr_reader :client, :event
end
