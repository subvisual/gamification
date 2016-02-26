class SlackEventHandler
  class SetUser < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /email.*is.*@.*\./

    def run
      return reply_already_set if already_set

      user = User.where(email: email).first

      if !user
        event.reply(I18n.t("bot.set_user.unkown"))
      elsif user.slack_username
        event.reply(I18n.t("bot.set_user.conflict", name: user.slack_username))
      else
        if user.update(slack_username: event.slack_username)
          event.reply(I18n.t("bot.set_user.success", name: user.name))
        else
          event.reply(I18n.t("bot.error"))
        end
      end
    end

    private

    def already_set
      event.user.present?
    end

    def reply_already_set
      if email == event.user.email
        event.reply(I18n.t("bot.set_user.already_set_same"))
      else
        event.reply(I18n.t("bot.set_user.already_set", email: event.user.email))
      end
    end

    def email
      @_email ||= event.text.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)[0]
    end
  end
end
