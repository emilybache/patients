class UsersController < ApplicationController
  def new
    @title = "Create Admin Account"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

end
