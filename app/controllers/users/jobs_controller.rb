class Users::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @jobs = current_user.jobs.order("created_at desc")
    # @jobs = Job.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = current_user
    @job = Job.find(params[:id])
    @employer = @job.users.employer.take
  end

end
