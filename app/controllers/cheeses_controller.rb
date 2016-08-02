class CheesesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    cheeses = Cheese.all.page params[:page]
    render locals: { cheeses: cheeses }
  end

  def show
    if Cheese.exists?(params[:id])
      cheese = Cheese.find(params[:id])
      render locals: { cheese: cheese }
    else
      render html: 'Cheese not found', status: 404
    end
  end

  def new
    render locals: { cheese: Cheese.new }
  end

  def create
    cheese = Cheese.new(cheese_params)
    if cheese.save
      redirect_to cheese
    else
      render :new, locals: { cheese: cheese }
    end
  end

  def edit
    render locals: { cheese: Cheese.find(params[:id]) }
  end

  def update
    if Cheese.find(params[:id])
      cheese = Cheese.find(params[:id])
      if cheese.update(cheese_params)
        redirect_to cheese
      else
        render :edit
      end
    else
      render html: 'Cheese not found', status: 404
    end
  end

  def destroy
    if Cheese.exists?(params[:id])
      Cheese.destroy(params[:id])
      flash[:notice] = "Cheese destroyed"
      redirect_to cheeses
    else
      flash[:alert] = "There was an error - please try again"
    end
  end

  private
  def cheese_params
    params.require(:cheese).permit(:name)
  end

end
