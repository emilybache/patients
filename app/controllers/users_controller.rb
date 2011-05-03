class UsersController < ApplicationController
  def new
    @title = "Create Admin Account"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Your application to become an Admin user was successful"
      redirect_to @user
    else
      @title = "Admin Account"
      render 'new'
    end
  end
end
