PickingDucks::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  
  NFL = 1
  NBA = 2
  MLB = 3
  NHL = 4
  SPORTS_NAMES = ["Football", "Basketball", "Baseball", "Hockey"]
  LEAGUE_NAMES = ["National Footbal League", "National Basketball Association", "Major League Baseball", "National Hockey League"]
  LEAGUE_NAMES_ABBR = ["NFL", "NBA", "MLB", "NHL"]
  
  
  
  #parlay odds table
  
  PARLAY_ODDS = [2.6, 6, 10, 20, 40, 75, 150, 300, 700, 1100]
  
  
  Paperclip.options[:command_path] = '/usr/bin/convert'
  
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
  
end

ENV["client_id"] = "CB524717"
ENV["api_key"] = "8f9f9848-44c3-4e2d-9888-045e8f042c0c"
