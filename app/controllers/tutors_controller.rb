class TutorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def new
    if Tutor.exists?(user: current_user)
      redirect_to tutors_path, alert: "You are already signed up as a tutor."
    else
      @tutor = Tutor.new
    end
  end


  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
    @tutor.first_name = current_user.first_name
    @tutor.last_name = current_user.last_name
    @tutor.email = current_user.email

    if @tutor.save
      redirect_to tutors_path(@tutor), notice: "You have successfully signed up as a tutor."
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def tutor_params
    params.require(:tutor).permit(:price, :qualification, :key_stage)
  end
end
