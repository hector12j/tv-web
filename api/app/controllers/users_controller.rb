class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user
    else
      render json: {'messaje': 'User not found'}
    end 
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if User.exists?(params[:id])
      render json: User.update(params[:id], user_params)
    else
      render json: {'messaje': 'User not found'}
    end
  end

  def delete
    if User.exists?(params[:id])
      render json: User.update(params[:id], user_params)
    else
      render json: {'messaje': 'User not found'}
    end
  end

  private

    def user_params
        params.permit(:email)
    end
    
end
