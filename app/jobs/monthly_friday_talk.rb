class MonthlyFridayTalk
  NAME = "monthly_friday_talk".freeze

  def initialize
    @friday_talk = Action.where(slug: :friday_talk).first
    @no_friday_talk = Action.where(slug: :no_friday_talk).first

    raise 'Friday Talk task not found' if !@friday_talk
    raise 'No Friday Talk task not found' if !@no_friday_talk
  end

  def call
    return if already_ran

    ActiveRecord::Base.transaction do
      User.all.each do |user|
        next if already_made_friday_talk(user)

        user.decrement!(:points, @no_friday_talk.points)
        user.events.create(action: @no_friday_talk, points: @no_friday_talk.points)
      end

      JobLog.create(name: NAME)
    end
  end

  private

  def already_ran
    last_run = JobLog.where(name: NAME).last
    last_run && last_run.created_at > 30.days.ago
  end

  def already_made_friday_talk(user)
    user.events.where(action: @friday_talk, created_at: 30.days.ago..DateTime.now).count != 0
  end
end
