module Chargify
  class Client
    module Usages
      def usages(subscription_id, component_id)
        get "subscriptions/#{subscription_id}/components/#{component_id}/usages"
      end

      def create_usage(subscription_id, component_id, attributes)
        post "subscriptions/#{subscription_id}/components/#{component_id}/usages", attributes
      end
    end
  end
end
