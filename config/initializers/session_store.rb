if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz', domain: 'https://dbfztech-api.herokuapp.com/'
  else
    Rails.application.config.session_store :cookie_store, key: '_Dragonball Fighterz' 
  end