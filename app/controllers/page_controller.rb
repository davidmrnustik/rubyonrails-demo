class PageController < ApplicationController

def home
end

def about_us
end

def contact_us
	@submitted = params['commit']
	@form_error = false
	@name = params['name']
	@email = params['email']

	if @name == "" || @email == ""
		flash.now['error'] = "Must enter your name!"
		@form_error = true
	end

	@question = params['question']
	@newsletter = params["newsletter"] == "newsletter"
	gender = params["gender"]
	@male = gender == "Male" # true or false
	@female = gender == "Female" # true or false
	@gender = params["gender"]
	@product = params["product"]
end

def products
end

def newsletter
end

def blog
end

def calendar
	@time = Time.now
	@month = params['month'].to_i
	@year = params['year'].to_i
	if(!(@month >= 1 && @month <= 12))
		@month = @time.strftime("%m").to_i
	end
	if (@year <= 0)
		@year = @time.strftime("%Y").to_i
	end
end

def articles
end

def login
end

end
