if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_framehameha_session', same_site: :lax, expire_after: 14.days
  else
    Rails.application.config.session_store :cookie_store, key: '_framehameha_session', same_site: :lax
end