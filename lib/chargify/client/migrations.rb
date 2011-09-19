module Chargify
  class Client
    module Migrations
      def create_migration(subscription_id, attributes)
        post "subscriptions/#{subscription_id}/migrations", :migration => attributes
      end
    end
  end
end
