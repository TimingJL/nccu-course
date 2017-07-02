class CoursesController < ApplicationController
	before_action :get_courses_data, only: [:index, :show]
	before_action :find_course, only: [:show]

	def index
	end

	def show
	end

	private

	def get_courses_data
	  	require 'rest-client'
	  	url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/testData.json'
	  	raw_content = RestClient.get(url)
	  	@data = JSON.parse( raw_content )		
	end

	def find_course
		@course  = @data[params[:id].to_i]
	end
end
