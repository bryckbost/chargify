module Chargify
  class Client
    module Products
      def products
        get("products")
      end
    end
  end
end
