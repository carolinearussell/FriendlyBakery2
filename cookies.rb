class Cookies
	attr_accessor :name, :photo, :price, :description

	def initialize (name, photo, price, description)
		@name = name
		@photo = photo
		@price = price
		@description = description
	end

end

z = Cookies.new("bran", "link", "3", "Mouth watering")

