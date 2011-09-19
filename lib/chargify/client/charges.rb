module Chargify
  class Client
    module Charges
      def create_charge(subscription_id, attributes)
        post "subscriptions/#{subscription_id}/charges", :charge => attributes
      end
    end
  end
end
