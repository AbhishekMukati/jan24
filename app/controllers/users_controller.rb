class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def index
    @user = if params[:search]
               User.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%")
             else
               User.all
             end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    byebug
    @user.__elasticsearch__.index_document
    if @user.save
      render json: @user, status: :created
    else

      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :name)
  end
end