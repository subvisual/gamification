class EventCreator
  def initialize(action_slug:, users: nil, user: nil)
    @action = Action.where(slug: action_slug).first
    @users = users || [user]

    raise "#{action_slug} task not found" unless @action
  end

  def call
    ActiveRecord::Base.transaction do
      users.each do |user|
        user.increment!(:points, action.points)
        user.events.create(action: action)
      end
    end
  end

  private

  attr_reader :users, :action
end
