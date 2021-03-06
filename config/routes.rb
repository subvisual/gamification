Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
  end

  root "dashboard#index"

  get "/auth/headquarters/callback", to: "sessions#headquarters"
end
