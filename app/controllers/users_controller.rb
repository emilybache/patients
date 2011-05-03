class UsersController < ApplicationController
  def new
    @title = "Create Admin Account"
  end

  def show
    @user = User.find(params[:id])
  end

end
