class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job


  def index
    @job = Job.find(params[:job_id])
    @applications = @job.applications.joins(:user).where(users: { role: 2 }).order("created_at desc")
  end

  def show
    @job = Job.find(params[:job_id])
    @application = Application.find(params[:id])
  end

  def new
    if current_user.job_seeker?
      # not sure about this approach
      @user = current_user
      @job = Job.find(params[:job_id])
      @application = Application.new(user_id: @user.id, job_id: @job.id)
    else
      flash[:warning] = "You must sign in as a job seeker before you can apply for this job."
      redirect_to new_user_session_path
    end
  end

  def create
    # not sure if this is the most elegant approach 
    @job = Job.find(params[:job_id]) 
    @application = current_user.applications.create(application_params)
    @application.job = @job

    if @application.save
      flash[:success] = "Well done. You have successfully submitted your application."
      redirect_to(job_application_path(@job, @application))
    else
      flash[:error] = "Sorry. We were unable to submit your application."
      render('new')
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    
    if @application.update(application_params)
      flash[:success] = "Huzzah! Your application was successfully updated!"
      redirect_to(application_path(@application.id))
    else
      render('edit')
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    flash[:success] = "Your job application has been successfully destroyed."
    redirect_to(applications_path)
  end

  private

  def application_params
    params.require(:application).permit(:first_name, :last_name, :email, :message, :attachment, :job_id, :user_id)
  end


  def find_job
    if params[:job_id]
      @job = Job.find(params[:job_id])
    end
  end


end
