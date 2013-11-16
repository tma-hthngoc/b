ProjectStatus::Application.routes.draw do

  get "logout/index"

  resources :web_pages


  resources :project_types


  resources :risk_summaries


  resources :users
  post "sessions", controller: 'sessions',  action: 'create'
  delete "sessions", controller: 'sessions', action: 'destroy'

  get "pipeline/index"
  get "pipeline/archive"
  get "pipeline", controller: 'pipeline', action: 'index'
  get "archive", controller: 'pipeline', action: 'archive'
  get "welcome/index"
  get "planner", controller: 'pipeline', action: 'planner'
  get "logout", controller: 'logout', action: 'index'

  resources :projects do
  resources :status_reports

  end
  resources :statuses
  resources :status_reports
  resources :report_periods
  resources :departments
  resources :activities
  resources :sponsors
  resources :sessions
  resource :logout

  root :to => 'welcome#index'

  #  get "/logout", controller: 'logout',action: 'index'
  # See how all your routes lay out with "rake routes"
end
