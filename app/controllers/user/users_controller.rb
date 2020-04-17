class User::UsersController < ApplicationController
  def top
    @user = current_user
  end
end
