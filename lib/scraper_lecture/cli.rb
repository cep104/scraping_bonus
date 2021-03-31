class CLI
    def list_items 
        Product.all.each do |product|
            puts "#{product.title}"
            if product.discount_price != nil
                puts "#{discount_price}"
            end
            
        end
    end
end