Rails.configuration.stripe = {
  :publishable_key => "pk_test_gAYcDnLR6ZYr0pE9MI9pc1PP",
  :secret_key      => "sk_test_sGJKaOPnCvEPpMFCvT36CKHg"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]