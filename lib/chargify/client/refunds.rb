module Chargify
  class Client
    module Refunds
      def create_refund(subscription_id, attributes)
        post "subscriptions/#{subscription_id}/refunds", :refund => attributes
      end
    end
  end
end
