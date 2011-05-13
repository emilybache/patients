class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update]

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
      sign_in @user
      flash[:success] = "Your application to become an Admin user was successful"
      redirect_to @user
    else
      @title = "Admin Account"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit details"
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.save
      flash[:success] = "Your details have been updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path) unless current_user?(@user)
  end
end
