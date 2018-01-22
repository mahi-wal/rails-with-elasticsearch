class UsersController < ApplicationController
  def index
    query = params[:user].present? ? params[:user][:query] : ''
    @users = User.search(query)
  end
end