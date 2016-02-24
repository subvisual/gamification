Slack.configure do |config|
  config.token = ENV.fetch("SLACK_API_TOKEN")
  fail "Missing ENV[SLACK_API_TOKEN]!" unless config.token
end

Rails.application.configure do
  config.after_initialize do
    SlackListener.new.start unless ENV["DISABLE_BOT"] == "1"
  end
end
