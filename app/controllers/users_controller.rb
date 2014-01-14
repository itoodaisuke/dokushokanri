class UsersController < ApplicationController
  def index
    @users = User.order('updated_at desc')
  end
end
