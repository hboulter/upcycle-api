if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_upcycle", domain: "http://enter-domain-name.com/"
else
    Rails.application.config.session_store :cookie_store, key: "_upcycle"
end