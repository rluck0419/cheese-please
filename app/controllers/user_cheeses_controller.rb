class UserCheesesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    user_cheeses = UserCheese.all.page params[:page]
    render locals: { user_cheeses: user_cheeses }
  end

  def show
    if UserCheese.exists?(params[:id])
      user_cheese = UserCheese.find(params[:id])
      render locals: { user_cheese: user_cheese }
    else
      render html: 'Fav cheese not found', status: 404
    end
  end

  def new
    render locals: { user_cheese: UserCheese.new }
  end

  def create
    user_cheese = UserCheese.new(user_cheese_params)
    if user_cheese.save
      redirect_to user_cheese
    else
      render :new
    end
  end

  def edit
    render locals: { user_cheese: UserCheese.find(params[:id]) }
  end

  def update
    if UserCheese.find(params[:id])
      user_cheese = UserCheese.find(params[:id])
      if user_cheese.update(user_cheese_params)
        redirect_to user_cheese
      else
        render :edit
      end
    else
      render html: 'Fav cheese not found', status: 404
    end
  end

  def destroy
    if UserCheese.exists?(params[:id])
      UserCheese.destroy(params[:id])
      flash[:notice] = "Fav cheese destroyed"
      redirect_to user_cheese
    else
      flash[:alert] = "There was an error - please try again."
    end
  end

  private
  def user_cheese_params
    params.require(:user_cheese).permit(:user_id, :cheese_id)
  end
end
