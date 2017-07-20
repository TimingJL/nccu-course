class CoursesController < ApplicationController
	#before_action :if_search_course
	before_action :get_courses_data
	before_action :find_course, only: [:show]
	before_action :set_issue, only: [:show, :edit, :update, :destroy]

	def index	
	end

	def show
		if params[:search]
			render :index
		end

		@comments = Comment.all
		@comment = Comment.new

		@count = 0
		#@comments.each do |comment|
		#	if comment.courseid == @course["courseid"].to_i
		#		@count = @count + 1
		#	end
		#end	

		@issues = Issue.all
		@issue = Issue.new
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
	  	@tempdata = JSON.parse( raw_content )
	  	@data = []

	  	# Search
	  	if params[:search]
			@tempdata.each do |d|
				if (d["semester"].include?params[:search]) || 
					(d["courseid"].include?params[:search])	||
					(d["name"].include?params[:search]) || 
					(d["instructor"].include?params[:search]) || 
					(d["point"].include?params[:search]) || 
					(d["session"].include?params[:search]) || 
					(d["place"].include?params[:search]) || 
					(d["language"].include?params[:search]) || 
					(d["asgeneral"].include?params[:search]) || 
					(d["generalclass"].include?params[:search]) || 
					(d["length"].include?params[:search]) || 
					(d["choose"].include?params[:search]) || 
					(d["coregeneral"].include?params[:search]) || 
					(d["change"].include?params[:search]) || 
					(d["note"].include?params[:search])
					@data.push(d)
				end
			end
		elsif params[:search].blank?
			@data = JSON.parse( raw_content )
	  	end
	end

	def find_course
		#@course  = @data[params[:id].to_i]
		@data.each do |d|
			if d["courseid"].to_i == params[:id].to_i
				@course = d
			end
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def comment_params
		params.require(:comment).permit(:content, :courseid, :user, :name)
	end

    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      #@issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :content, :courseid, :user, :username, :useremail)
    end	
end
