class SlackListener
  def start
    Thread.new do
      begin
        EM.run do
          client = Slack::RealTime::Client.new

          client.on :hello do
            puts I18n.t("bot.hello", name: client.self.name, team_name: client.team.name)
          end

          client.on(:message) do |data|
            puts "Received: #{data.text}" if Rails.env.development?
            event = SlackEvent.new(data, client)
            SlackEventHandler.handle(event)
          end

          client.start_async
          puts 'Listening'
        end
      rescue Exception => e
        STDERR.puts "#{e.class}: #{e}"
        STDERR.puts e.backtrace
        raise e
      end
    end
  end
end
