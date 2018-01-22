class UsersController < ApplicationController
  def index
    @users = User.search(params[:user][:query])
  end
end