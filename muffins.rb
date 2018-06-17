class Muffins
	attr_accessor :name, :photo, :price, :description

	def initialize (name, photo, price, description)
		@name = name
		@photo = photo
		@price = price
		@description = description
	end

end

y = Muffins.new("bran", "link", "3", "heathty for the heart")
