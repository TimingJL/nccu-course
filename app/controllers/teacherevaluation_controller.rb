class TeacherevaluationController < ApplicationController
	def index
		url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/inst_evaluation.json'
		raw_content = RestClient.get(url)
		@teacherevaluations = JSON.parse( raw_content )
	end
end
