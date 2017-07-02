class CoursesController < ApplicationController
	def index
	  	require 'rest-client'
	  	url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/testData.json'
	  	raw_content = RestClient.get(url)
	  	@data = JSON.parse( raw_content )

	end
end
