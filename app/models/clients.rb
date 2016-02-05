class Clients
  def self.slack_rtm
    url = SlackRTM.get_url token: ENV.fetch('SLACK_API_TOKEN')
    SlackRTM::Client.new websocket_url: url
  end

  def self.slack_api
    Slack::RPC::Client.new ENV.fetch('SLACK_API_TOKEN')
  end
end
