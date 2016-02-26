class SlackEventHandler
  class Unrecognized < Base
    def can_handle?
      event.bot? || !event.user
    end

    def run
      return if event.bot?
      event.reply(I18n.t("bot.unkown_user", username: event.slack_username))
    end
  end
end
