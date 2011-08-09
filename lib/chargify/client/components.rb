module Chargify
  class Client
    module Components
      def subscription_components(subscription_id)
        get "subscriptions/#{subscription_id}/components"
      end

      def subscription_component(subscription_id, id)
        get "subscriptions/#{subscription_id}/components/#{id}"
      end

      def product_family_components(product_family_id)
        get "product_families/#{product_family_id}/components"
      end

      def product_family_component(product_family_id, id)
        get "product_families/#{product_family_id}/components/#{id}"
      end

      def create_component(product_family_id, type, attributes)
        post "product_families/#{product_family_id}/#{type}", attributes
      end
    end
  end
end
