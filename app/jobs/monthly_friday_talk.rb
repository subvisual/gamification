class MonthlyFridayTalk
  NAME = "monthly_friday_talk".freeze

  def initialize
    @friday_talk = Action.where(slug: :friday_talk).first

    raise "Friday Talk task not found" unless friday_talk
  end

  def call
    return if already_ran

    ActiveRecord::Base.transaction do
      users = User.all.select(&method(:no_friday_talk))
      EventCreator.new(action_slug: :no_friday_talk, users: users).call
      JobLog.create(name: NAME)
    end
  end

  private

  attr_reader :friday_talk

  def already_ran
    last_run_at > 1.months.ago
  end

  def no_friday_talk(user)
    user.events.where(action: friday_talk, created_at: last_run_at..DateTime.now).empty?
  end

  def last_run_at
    @_last_run_date ||= JobLog.for_name(NAME).pluck(:created_at).first || 2.months.ago
  end
end
