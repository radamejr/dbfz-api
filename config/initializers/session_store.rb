if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz', domain: 'http://localhost:8080/', expire_after: 14.days
  else
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz' 
end