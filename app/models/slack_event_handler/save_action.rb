class SlackEventHandler
  class SaveAction < Base
    include MatcherList
    matcher Matchers::IsMessage
    matcher Matchers::HasRegex, regex: /(did|done|made|wrote)/

    include ActionList
    action :blog_post, /blog post/
    action :friday_talk, /friday talk/

    def run
      send_no_action unless action_slug
      EventCreator.new(action_slug: action_slug, user: event.user).call
      send_success
    end

    private

    def send_no_action
      client.send_message("I'm not sure I understood master. Could you please rephrase it?")
    end

    def send_success
      client.send_message("Nice work master! I've registered your actions. They will be reminded throughout history! You now have #{event.user.points} points.")
    end
  end
end
