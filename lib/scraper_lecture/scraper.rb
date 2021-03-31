class Scraper 
    def self.get_data
        url = URI.parse("https://shop.hbo.com/collections/game-of-thrones")
        response = Net::HTTP.get(url)
        noko = Nokogiri::HTML(response)
        
        
        noko.css(".grid-view-item").each do |item|
            relative_path = item.css("a").first.attributes["href"].value
            link = "https://shop.hbo.com" + relative_path
            title = item.css(".h4").text
            price = item.css(".product-price__price").text
            original_price = price.split(" ")[0].gsub("$","").to_f
            discount_price = price.split(" ")[1].gsub("$","").to_f
            # discount_price = price.split(" ")[1] ? price.split(" ")[1].gsub("$","").to_f : original_price
            binding.pry
            Product.new(link, title, original_price, discount_price)
            # link, title, original_price, discount_price
        end
        
    end
end