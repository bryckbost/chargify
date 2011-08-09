module Chargify
  class Client
    module Migrations
      def create_migration(subscription_id, attributes)
        post "subscriptions/#{subscription_id}/migrations", attributes
      end
    end
  end
end
