class Product 
    attr_accessor :title, :original_price, :discount_price, :link

    @@all = []

    def initialize(link, title, original_price, discount_price)
        @link = link 
        @title = title 
        @original_price = original_price
        @discount_price = discount_price
        save
    end
    
    def save 
        @@all << self
    end

    def self.all
        @@all
    end
end