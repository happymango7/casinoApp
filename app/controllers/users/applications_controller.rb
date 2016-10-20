class Users::ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @applications = current_user.applications.order("created_at desc")
  end

  def show
    @user = current_user
    @application = Application.find(params[:id])
    @job = @application.job
  end

end