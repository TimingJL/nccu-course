class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_courses_data, only: [:destroy, :create]
  

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to issue_url(@comment.issue_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to issue_url(@comment.issue_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    issue_id = @comment.issue_id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to issue_url(issue_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private

	def get_courses_data
	  	require 'rest-client'
	  	url = 'https://raw.githubusercontent.com/TimingJL/nccu-course/master/data/testData.json'
	  	raw_content = RestClient.get(url)
	  	@data = JSON.parse( raw_content )		
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_comment
	  @comment = Comment.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def comment_params
	  #params.require(:comment).permit(:content, :courseid, :user, :name)
    params.require(:comment).permit(:content, :courseid, :name, :issue_id)
	end
end
