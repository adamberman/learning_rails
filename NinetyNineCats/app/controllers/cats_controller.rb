class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def new
    @cat = Cat.new
    render :new
  end
  
  
  
  private
  
  def cat_params
    params.require(:cat).permit(:name, :age, :birth_date, :sex, :color, :description)
  end
end