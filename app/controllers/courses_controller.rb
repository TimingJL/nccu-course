class CoursesController < ApplicationController
	before_action :get_courses_data, only: [:index, :show]
	before_action :find_course, only: [:show]

	def index
	end

	def show
		@comments = Comment.all
		@comment = Comment.new
	end

	def new
		@comment = Comment.new
	end

	def create
	    @comment = Comment.new(comment_params)

	    respond_to do |format|
	      if @comment.save
	        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
	        format.json { render :show, status: :created, location: @comment }
	      else
	        format.html { render :new }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
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

	# Never trust parameters from the scary internet, only allow the white list through.
	def comment_params
	  params.require(:comment).permit(:content, :courseid, :user, :name)
	end	
end
