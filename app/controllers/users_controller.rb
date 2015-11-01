class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You have signed up successfully."
      redirect_to projects_path
    else
      flash[:error] = "We couldn't sign you up at this time. Sorry! Please try again later."
      render :new
    end
  end

  def edit
  end

  def new
    @user = User.new
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile has been updated."
      redirect_to projects_path
    else
      flash[:error] = "User profile could not be updated."
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
