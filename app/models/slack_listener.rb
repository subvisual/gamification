class SlackListener
  def start
    EM.run do
      client = Slack::RealTime::Client.new

      client.on :hello do
        puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
      end

      client.on(:message) do |data|
        puts "Received: #{data.text}" if Rails.env.development?
        event = SlackEvent.new(data, client)
        SlackEventHandler.handle(event)
      end

      client.start!
      puts 'Listening'
    end
  end

  private
end
