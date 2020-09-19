if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz', domain: 'https://www.framehameha.com/', same_site: :lax, expire_after: 14.days
  else
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz', domain: 'http://localhost/', same_site: :lax
end