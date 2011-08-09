module Chargify
  class Client
    module Transactions
      def transactions
        get "transactions"
      end

      def subscription_transactions(subscription_id)
        get "subscriptions/#{subscription_id}/transactions"
      end
    end
  end
end
