class DonationsController < ApplicationController
  def new
  end
  
  def create
    # Log Stripe PaymentIntent request details
    Rails.logger.debug("Stripe PaymentIntent Request: #{params.inspect}")

    # Create a PaymentIntent on Stripe with the specified amount and payment method
    payment_intent = Stripe::PaymentIntent.create({
      amount: (params[:amount].to_i * 100), # Convert dollars to cents
      currency: 'usd',
      payment_method: params[:payment_method_id],  # The payment method ID from the front end
      confirm: true,
      automatic_payment_methods: { enabled: true, allow_redirects: 'never' } # We don't allow redirects
    })

    # If the payment succeeds, redirect to the root path with a success message
    redirect_to root_path, notice: "Thank you for your donation!"

  rescue Stripe::CardError => e
    # If there’s a card error, redirect to the new donation page with the error message
    redirect_to new_donation_path, alert: e.message
  rescue Stripe::InvalidRequestError => e
    # Handle any issues with the request itself (e.g., invalid payment method)
    redirect_to new_donation_path, alert: "Invalid request: #{e.message}"
  rescue Stripe::AuthenticationError => e
    # Handle authentication issues (e.g., invalid API keys)
    redirect_to new_donation_path, alert: "Authentication error: #{e.message}"
  rescue Stripe::APIConnectionError => e
    # Handle network communication errors (e.g., network timeouts)
    redirect_to new_donation_path, alert: "Network error: #{e.message}"
  rescue Stripe::StripeError => e
    # Handle any other Stripe errors
    redirect_to new_donation_path, alert: "Payment error: #{e.message}"
  rescue => e
    # Catch any other unexpected errors
    redirect_to new_donation_path, alert: "Unexpected error: #{e.message}"
  end
end
