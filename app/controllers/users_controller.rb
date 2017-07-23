class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	 @user = User.find(params[:id])
	end

	def update
	 @user = User.find(params[:id])
	 if @user.update(user_params)
	   redirect_to users_path
	 else
	   render 'edit'
	 end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
		    redirect_to users_path, notice: "User deleted."
		end
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.require(:issue).permit(:title, :content, :courseid, :user, :username, :useremail)
      params.require(:user).permit(:username, :email, :admin)
    end	
end
