module SlackEventHandler::MatcherList
  extend ActiveSupport::Concern

  included do
    @matchers = []

    def self.matcher(matcher_class, params = {})
      @matchers.push matcher_class.new(params)
    end

    def match?(event)
      self.class.matchers.all? do |matcher|
        matcher.match?(event)
      end
    end
  end

  class_methods do
    def matchers
      @matchers
    end
  end
end
