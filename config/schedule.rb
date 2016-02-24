job_type :run, "cd :path && :environment_variable=:environment DISABLE_BOT=1 bundle exec rake :task --silent :output"

every :friday, :at => "10pm" do
  run "jobs:reset_props"
end

every 1.days, :at => "10pm" do
  run "jobs:quarterly_blog_post"
end

every 1.days, :at => "10pm" do
  run "jobs:monthly_friday_talk"
end

every :weekday, :at => "10pm" do
  run "jobs:register_vacations"
end
