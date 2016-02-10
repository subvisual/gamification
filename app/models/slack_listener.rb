class SlackListener
  def initialize
     @messages = Queue.new
  end

  def start
    @client_thread = Thread.new do
      client = SlackRTM::Client.new websocket_url: slack_url
      puts 'Listening'
      client.on(:message) do |data|
        event = SlackEvent.new(data)
        slack_client = SlackClient.new(client, event)

        SlackEventHandler.handle(event, slack_client)
      end
      client.main_loop
    end

    @client_thread.abort_on_exception = true
  end

  private

  def slack_url
    SlackRTM.get_url token: ENV.fetch('SLACK_API_TOKEN')
  end
end
