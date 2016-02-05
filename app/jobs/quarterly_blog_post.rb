class QuarterlyBlogPost
  NAME = "quarterly_blog_post".freeze

  def initialize
    @blog_post = Action.where(slug: :blog_post).first

    raise "Blog Post task not found" unless @blog_post
  end

  def call
    return if already_ran

    ActiveRecord::Base.transaction do
      users = User.all.select(&method(:no_blog_post))
      EventCreator.new(action_slug: :no_blog_post, users: users).call
      JobLog.create(name: NAME)
    end
  end

  private

  attr_reader :blog_post

  def no_blog_post(user)
    user.events.where(action: blog_post, created_at: last_run_at..DateTime.now).empty?
  end

  def already_ran
    last_run_at > 3.months.ago
  end

  def last_run_at
    @_last_run_date ||= JobLog.for_name(NAME).pluck(:created_at).first || 4.months.ago
  end
end
