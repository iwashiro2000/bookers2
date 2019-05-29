class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  	@users = User.all
  	@user = current_user
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to book_path(book.id)
  	else
  		render :edit
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated book successfully."
  		redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end


  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
  	end
  end

  def logged_in_user
  	unless logged_in?
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end
end
