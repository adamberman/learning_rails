class CatRentalRequest < ApplicationController
  
  def new
    @request = CatRentalRequest.new
    render :new
  end
  
  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      render :new
    end
  end
  
  
  
  private
  
  def request_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :status,
    :cat_id)
  end
end