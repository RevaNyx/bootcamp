Stripe.api_key = Rails.application.credentials.dig(:stripe, :test_secret_key)
Rails.logger.debug("Stripe is set to: #{Stripe.api_key}")
