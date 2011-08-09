module Chargify
  class Client
    module Products
      def products
        get "products"
      end

      #TODO Show by handle
      def product(id)
        get "products/#{id}"
      end
    end
  end
end
