module Chargify
  class Client
    module Customers
      def customers
        get "customers"
      end

      #TODO Customer by reference
      def customer(id)
        get "customers/#{id}"
      end

      def create_customer(attributes)
        post "customers", attributes
      end

      def update_customer(id, attributes)
        put "customers/#{id}", attributes
      end
    end
  end
end