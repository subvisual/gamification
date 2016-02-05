class QuarterlyBlogPost
  NAME = "quarterly_blog_post".freeze

  def initialize
    @blog_post = Action.where(slug: :blog_post).first
    @no_blog_post = Action.where(slug: :no_blog_post).first

    raise 'Blog Post task not found' if !@blog_post
    raise 'No Blog Post task not found' if !@no_blog_post
  end

  def call
    return if already_run

    ActiveRecord::Base.transaction do
      User.all.each do |user|
        next if already_wrote_blog_post(user)

        user.decrement!(:points, @no_blog_post.points)
        user.events.create(action: @no_blog_post, points: @no_blog_post.points)
      end

      JobLog.create(name: NAME)
    end
  end

  private

  def already_wrote_blog_post(user)
    user.events.where(action: @blog_post, created_at: 90.days.ago..DateTime.now).count != 0
  end

  def already_run
    last_run = JobLog.where(name: NAME).last
    last_run && last_run.created_at > 90.days.ago
  end
end
