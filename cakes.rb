class Cakes
    attr_accessor :name, :photo, :price, :description

    def initialize(name, photo, price, description)
        @name = name
        @photo = photo
        @price = price
        @description = description    
    end

end

x = Cakes.new("chocolate", "link", "12", "a great cake")





