Rails.application.configure do
  config.after_initialize do
    SlackListener.new.start
  end
end
