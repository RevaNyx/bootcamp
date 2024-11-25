class DonationsController < ApplicationController
  def new
    # Render the new donation form
  end

  def create
    # Log Stripe PaymentIntent request details
    Rails.logger.debug("Stripe PaymentIntent Request: #{params.inspect}")

    begin
      if params[:recurring] == 'true'
        # Create a recurring subscription using Stripe
        customer = Stripe::Customer.create({
          email: params[:email],
          payment_method: params[:payment_method_id],
          invoice_settings: { default_payment_method: params[:payment_method_id] }
        })

        subscription = Stripe::Subscription.create({
          customer: customer.id,
          items: [{ price: 'your_price_id' }], # Replace 'your_price_id' with the Stripe price ID
          expand: ['latest_invoice.payment_intent'] # Expand payment intent for immediate confirmation
        })

        # Save the donation record with subscription details
        Donation.create!(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          amount: subscription.plan.amount / 100.0, # Convert cents to dollars
          recurring: true,
          stripe_subscription_id: subscription.id
        )

        redirect_to root_path, notice: "Thank you for committing to a monthly donation!"
      else
        # Create a one-time PaymentIntent on Stripe
        payment_intent = Stripe::PaymentIntent.create({
          amount: (params[:amount].to_i * 100), # Convert dollars to cents
          currency: 'usd',
          payment_method: params[:payment_method_id],
          confirm: true,
          automatic_payment_methods: { enabled: true, allow_redirects: 'never' }
        })

        # Save the donation record with payment details
        Donation.create!(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          amount: params[:amount].to_f,
          recurring: false,
          stripe_charge_id: payment_intent.id
        )

        redirect_to root_path, notice: "Thank you for your one-time donation!"
      end
    rescue Stripe::CardError => e
      redirect_to new_donation_path, alert: e.message
    rescue Stripe::InvalidRequestError => e
      redirect_to new_donation_path, alert: "Invalid request: #{e.message}"
    rescue Stripe::AuthenticationError => e
      redirect_to new_donation_path, alert: "Authentication error: #{e.message}"
    rescue Stripe::APIConnectionError => e
      redirect_to new_donation_path, alert: "Network error: #{e.message}"
    rescue Stripe::StripeError => e
      redirect_to new_donation_path, alert: "Payment error: #{e.message}"
    rescue => e
      redirect_to new_donation_path, alert: "Unexpected error: #{e.message}"
    end
  end

  private

  def donation_params
    params.permit(:first_name, :last_name, :email, :amount, :recurring, :payment_method_id)
  end
end
