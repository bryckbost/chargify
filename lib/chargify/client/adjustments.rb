module Chargify
  class Client
    module Adjustments
      def create_adjustment(subscription_id, attributes)
        post "subscriptions/#{subscription_id}/adjustments", :adjustment => attributes
      end
    end
  end
end
