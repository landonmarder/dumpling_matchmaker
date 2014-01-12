class RequestsController < ApplicationController
  def index
    @requests = Request.today
  end

  def create
    @request = Request.new
    @request.soup = params["soup"]
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

  def destroy
    @request = Request.find(params[:id])
    @user = current_user
    SoupFulfillment.match(@user, @request.user, @request).deliver

    Request.find(params[:id]).destroy
    redirect_to requests_path,
    notice: 'Request Fulfilled!'

  end


  private

  def request_params
    params.require(:request).permit(:soup, :current_user)
  end


end
