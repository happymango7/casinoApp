class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @user = current_user
    @jobs = Job.all.order("created_at desc")
    # @jobs = Job.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  def show
    @job = Job.find(params[:id])
    @employer = @job.users.employer.take
  end

  def new
    @user = current_user
    @job = current_user.jobs.new
  end

  def create
    @user = current_user
    @job = @user.jobs.create(job_params)

    if @job.save
      flash[:success] = "Well done. You have successfully created a new job post."
      redirect_to(job_path(@job))
    else
      flash[:error] = "Sorry. We were unable to save your job posting."
      render('new')
    end
  end

  def edit
    @user = current_user
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    
    if @job.update(job_params)
      flash[:success] = "Huzzah! Your job was successfully updated!"
      redirect_to(job_path(@job.id))
    else
      flash[:error] = "Sorry. We were unable to update your job posting."
      render('edit')
    end
  end

  def destroy
    @user = current_user
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "Your job post for #{@job.title} has been successfully destroyed."
    redirect_to user_jobs_path(@user)
  end

  private

  def job_params
    params.require(:job).permit(:company, :title, :description, :city, :state, :link)
  end


end
