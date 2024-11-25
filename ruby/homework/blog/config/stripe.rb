
Stripe.api_key = Rails.application.credentials.stripe[:secret_key]

Rails.logger.debug("Stripe is set to: #{Stripe.api_key}")
