module Chargify
  class Client
    module Coupons
      def coupon(product_family_id, id)
        get "product_families/#{product_family_id}/coupons/#{id}"
      end

      def find_coupon(product_family_id, code)
        get "product_families/#{product_family_id}/coupons/find", :code => code
      end
    end
  end
end
