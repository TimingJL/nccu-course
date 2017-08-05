class IssuesController < ApplicationController
  before_action :set_issue, only: [:new, :show, :edit, :update, :destroy]
  before_action :get_courses_data

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.user_id = current_user.id if current_user

    respond_to do |format|
      if @issue.save
        #format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.html { redirect_to course_path(@issue.courseid), notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      #params.require(:issue).permit(:title, :content, :courseid, :user, :username, :useremail)
      params.require(:issue).permit(:title, :content, :courseid, :username, :useremail)
    end
end


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
          (d["courseid"].include?params[:search]) ||
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