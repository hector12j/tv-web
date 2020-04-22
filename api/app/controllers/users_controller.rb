class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def delete
  end
  private

    def user_params
        params.require(:user).permit(:email)
    end

    def set_user
      user = User.find(params[:id])
    end
end
