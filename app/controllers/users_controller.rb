class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    if @user.save
      session[:user_id] = @user.id # auto log in
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
