ProjectStatus::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.paperclip_defaults = {
    # This is in Dev and Prod, not in Test. 
    # Comment out in dev for local storage.
    :storage => :s3,
    :s3_host_name => 's3-ap-southeast-1.amazonaws.com',
    :s3_credentials => {
      :bucket => 'wallem-project-status-uat',
      :access_key_id => 'AKIAJAUXIJZNARVJMODA',
      :secret_access_key => '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' 
    }
  }

  # SSO configs
  config.token_key = 'aaid17'
  config.master_server = 'http://localhost:3047/'
  config.sso_service = 'api/sso'
  config.login_service = 'home/login'
  config.logout_service = 'home/logout/'
  config.backup_server = 'http://sso.wallem.com/idp/'
  config.generate_user = true
  config.default_role = 'read-only'
  config.domain = 'wallem.com'

end
