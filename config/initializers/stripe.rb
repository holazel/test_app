if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_KmCGWrb4TXSjPO1LFKYMOku9',
    secret_key: 'sk_test_KdeLbej1qhwc4qLw6Scmbm4G'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]