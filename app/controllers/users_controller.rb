class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
      if @user.creative?
           redirect_to creative_path(@user)
      else
           redirect_to member_path(@user)
      end
  end

end
