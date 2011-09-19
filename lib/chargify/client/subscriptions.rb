module Chargify
  class Client
    module Subscriptions
      def subscriptions
        get "subscriptions"
      end

      def customer_subscriptions(customer_id)
        get "customers/#{customer_id}/subscriptions"
      end

      def subscription(id)
        get "subscriptions/#{id}"
      end

      def create_subscription(attributes)
        post "subscriptions", :subscription => attributes
      end

      def update_subscription(id, attributes)
        put "subscriptions/#{id}", :subscription => attributes
      end

      def cancel_subscription(id)
        delete "subscriptions/#{id}"
      end

      def cancel_subscription_at_end_of_period(id)
        put "subscriptions/#{id}", :cancel_at_end_of_period => true
      end

      def reactivate_subscription(id)
        put "subscriptions/#{id}/reactivate"
      end

      def reset_subscription_balance(id)
        put "subscriptions/#{id}/reset_balance"
      end
    end
  end
end
