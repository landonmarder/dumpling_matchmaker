class RequestsController < ApplicationController
  def index
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to request_path(@request),
        notice: "Request Submitted"
    else
      render :new
    end
  end

  def new
    @request = Request.new
  end

  private

  def request_params 
    params.require(:request).permit(:soup)
  end

  
end
