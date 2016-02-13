class RegisterVacations
  NAME = "register_vacations".freeze

  def call
    return if already_ran

    ActiveRecord::Base.transaction do
      User.all.map do |user|
        next unless user.on_vacations?

        EventCreator.new(action_slug: :day_on_vacations, user: user).call
      end

      JobLog.create(name: NAME)
    end
  end

  private

  def already_ran
    last_run_at > 1.day.ago
  end

  def last_run_at
    @_last_run_date ||= JobLog.for_name(NAME).pluck(:created_at).first || 2.days.ago
  end
end
