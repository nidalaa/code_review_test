if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: "_doctor_api", domain: "doctor_api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_doctor_api"
end