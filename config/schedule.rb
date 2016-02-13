every :friday, :at => "10pm" do
  rake "jobs:reset_props"
end

every 1.days, :at => "10pm" do
  rake "jobs:quarterly_blog_post"
end

every 1.days, :at => "10pm" do
  rake "jobs:monthly_friday_talk"
end

every :weekday, :at => "10pm" do
  rake "jobs:register_vacations"
end
