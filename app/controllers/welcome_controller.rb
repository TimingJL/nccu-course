class WelcomeController < ApplicationController
  def index
  	require 'rest-client'
  	url = 'https://gist.githubusercontent.com/planetoftheweb/2c2f3b03b72a7f2ae923/raw/d0236fd0a945fdac7acd463f268bd20ebe4d766c/data.json'
  	raw_content = RestClient.get(url)
  	data = JSON.parse( raw_content )
  	@name = data["speakers"][0]["name"]
  end
end
