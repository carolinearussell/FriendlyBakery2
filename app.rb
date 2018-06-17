require 'sendgrid-ruby'
require 'sinatra'
require 'shotgun'
require 'materialize-sass'
require 'json'


require_relative './cakes'
require_relative './cookies'
require_relative './muffins'

include SendGrid



get '/' do
	erb :index
end

#dynamic route
get '/cakes' do
	@my_cake1 = Cakes.new("Chocolate", "/images/Bestcake.jpg", "Call for Price", "A Great Wedding Cake")
	@my_cake2 = Cakes.new("Various", "/images/greatcake.jpg", "Call for Price", "Whatever You like, We Can Make It")
	@my_cake3 = Cakes.new("You Name It", "/images/weddingCake1.jpg", "Call for Price", "A Great Cake")
	erb :cakes
end

get '/muffins' do
	@my_muffin1 = Muffins.new("Lemon Poppy Seed Muffin", "/images/Lemon.jpg", "$4.50", "Heathty for the Heart")
	@my_muffin2 = Muffins.new("Apple Cinnamon Muffin", "/images/applecin.jpg", "$4.50", "Yes Baby, Bring It On Goodness")
	@my_muffin3 = Muffins.new("Roast Pumpkin & Bacon Savoury Muffin", "/images/Bacon-Muffin.jpg", "$4.50", "Whatever Makes You Happy")
	erb :muffins
end

get '/cookies' do
	@my_cookies1 = Cookies.new("Chocolate Chip Cookies", "/images/perfectcookies.jpg", "$3.00", "Mouth Watering, the Way You like Them")
	@my_cookies2 = Cookies.new("Rolled Oats Raisins Cookie", "/images/OatCookie.jpg", "$3.00", "Hmmm Hmmm Goodness")
	@my_cookies3 = Cookies.new("Fancy Dressup Cookies", "/images/cookie-art.jpg", "Call of Price", "MouthFull of Fancy Goodness")
	erb :cookies
end



post '/contact' do

 @email = params[:email]
 	@opinion = params[:opinion]
	from = Email.new(email: 'carolinerussell2017@gmail.com')
	to = Email.new(email: @email)
	subject = 'Here is your 15% Off!'
	content = Content.new(type: 'text/plain', value: "Thank you for signing up! 
		Enter CAKES for 15% off your first order.

		Please check your email for our current catalog")
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	if response.status_code == 401
		    error_hash = JSON.parse(response.body)
		    @errors = error_hash["errors"]
		  end
		  p response.status_code
end

