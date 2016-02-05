namespace :db do
  task :update_slack_data do
    slack_user = Clients.slack_api.users.list.body["members"]

    ActiveRecord::Base.transaction do
      slack_users.each do |slack_user|
        User.
          where(slack_username: slack_user["name"]).
          first.
          update(slack_data: slack_user)
      end
    end
  end
end
