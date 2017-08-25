class CoursesController < ApplicationController
	#before_action :if_search_course
	before_action :get_courses_data
	before_action :find_course, only: [:show]
	before_action :set_issue, only: [:show, :edit, :update, :destroy]

	def index
		@issues = Issue.all
		@comments = Comment.all

		collection = []
		@course_order = []
		@issues.each do |issue|
			collection.push([issue.courseid, issue.created_at])
		end
		@comments.each do |comment|
			collection.push([comment.courseid, comment.created_at])
		end
		collection = collection.sort_by{|courseid, created_at| created_at.to_time.to_i }
		collection.reverse!
		collection.each do |course|
			@course_order.push(course[0])
		end
		@course_order.uniq!

		if params[:search]
			@courses = Course.search(params[:search]).page(params[:page]).per(100)
		elsif params[:name] || params[:department] || params[:instructor]
			@courses = Course.search_name(params[:name]).search_department(params[:department]).search_instructor(params[:instructor]).page(params[:page]).per(100)
		else
			@courses = Course.page(params[:page]).per(100)
		end

	end

	def show
		if params[:search]
			render :index
		end

		@issues = Issue.all
		@issue = Issue.new
	end

	def create
		# @courses = Course.all
	 #  	url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/10601coursedata.json'
	 #  	raw_content = RestClient.get(url)
	 #  	@tempdata = JSON.parse( raw_content )

	 #  	@tempdata[0..20].each do |d|
	 #  		if !(Course.exists?(:courseid => d["courseid"]))

	 #  			@course = Course.new(:courseid => d["courseid"],
	 #  					:semester => d["semester"],
	 #  					:instructor => d["instructor"],
	 #  					:point => d["point"],
	 #  					:session => d["session"],
	 #  					:place => d["place"],
	 #  					:language => d["language"],
	 #  					:asgeneral => d["asgeneral"],
	 #  					:generalclass => d["generalclass"],
	 #  					:department => d["department"],
	 #  					:length => d["length"],
	 #  					:choose => d["choose"],
	 #  					:coregeneral => d["coregeneral"],
	 #  					:agenda => d["agenda"],
	 #  					:name => d["name"],
	 #  					:change => d["change"],
	 #  					:note => d["note"]
	 #  				)
	 #  			@course.save
	 #  		end
	 #  	end		
	end

	def new
		@course = Course.new
	end

	def destroy
		# Course.delete_all
		# redirect_to root_path
	end

	private

	def get_courses_data
	  	require 'rest-client'
	  	# url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/testData.json'
	  	url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/10601coursedata.json'
	  	raw_content = RestClient.get(url)
	  	@tempdata = JSON.parse( raw_content )
	  	@data = []

	  	@searchName =[]
	  	@searchInstructor =[]


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
					(d["department"].include?params[:search]) ||
					(d["note"].include?params[:search])
					@data.push(d)
				end
			end
	  	elsif params[:name] || params[:department] || params[:instructor]
	  		if params[:name]
	  			@tempdata.each do |d|
	  				if (d["name"].include?params[:name])
	  					@searchName.push(d)
	  				end
	  			end
	  		else
	  			@searchName = JSON.parse( raw_content )
	  		end

	  		if params[:instructor]
	  			@searchName.each do |d|
	  				if (d["instructor"].include?params[:instructor])
	  					@searchInstructor.push(d)
	  				end
	  			end
	  		else
	  			@searchInstructor = JSON.parse( raw_content )
	  		end

	  		if params[:department]
	  			@searchInstructor.each do |d|
	  				if (d["department"].include?params[:department])
	  					@data.push(d)
	  				end
	  			end
	  		else
	  			@data = JSON.parse( raw_content )
	  		end	  		  		
	  	elsif
	  		@data = JSON.parse( raw_content )
	  	end

		respond_to do |format|
			format.html
			format.html.phone
			format.html.tablet
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

    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      #@issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :content, :courseid, :user, :username, :useremail)
    end
end
