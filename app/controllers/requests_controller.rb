class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id

    if @request.save
      redirect_to requests_path,
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
    params.require(:request).permit(:soup, :current_user)
  end


end
