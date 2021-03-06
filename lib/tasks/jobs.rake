namespace :jobs do
  task monthly_friday_talk: :environment do
    MonthlyFridayTalk.new.call
  end

  task quarterly_blog_post: :environment do
    QuarterlyBlogPost.new.call
  end

  task reset_props: :environment do
    ResetProps.new.call
  end

  task register_vacations: :environment do
    RegisterVacations.new.call
  end
end
