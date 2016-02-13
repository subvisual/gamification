class ResetProps
  NAME = "reset_props".freeze

  def call
    return if already_ran

    ActiveRecord::Base.transaction do
      User.all.map do |user|
        user.update!(props: 10)
      end

      JobLog.create(name: NAME)
    end
  end

  private

  def already_ran
    last_run_at > 1.week.ago
  end

  def last_run_at
    @_last_run_date ||= JobLog.for_name(NAME).pluck(:created_at).first || 2.months.ago
  end
end
