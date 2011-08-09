module Chargify
  class Client
    module Statements
      def statements(subscription_id)
        get "subscriptions/#{subscription_id}/statements"
      end

      def statement(id)
        get "statements/#{id}"
      end
    end
  end
end
