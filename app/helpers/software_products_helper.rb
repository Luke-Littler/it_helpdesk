module SoftwareProductsHelper
    def software_product_status_colour(software_product)
        case software_product.status
        when "expired"
            "bg-red-50 text-red-700"
        when "active"
            "bg-green-50 text-green-700"
        end
    end
end
