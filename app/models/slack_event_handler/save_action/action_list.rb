module SlackEventHandler::SaveAction::ActionList
  extend ActiveSupport::Concern

  included do
    @actions = []

    def self.action(slug, regex)
      actions.push({slug: slug, regex: regex})
    end

    def action_slug
      @_action = begin
        action =  self.class.actions.find do |action|
          event.text.downcase.match(action[:regex])
        end

        action[:slug] if action
      end
    end
  end

  class_methods do
    def actions
      @actions
    end
  end
end
