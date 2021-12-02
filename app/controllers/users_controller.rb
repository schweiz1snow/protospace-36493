class UsersController < ApplicationController

  def show
    @prototype = Prototype.all
    @user = User.find(params[:id])
  end

end
