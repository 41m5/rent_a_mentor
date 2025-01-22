class TutorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def new
    @tutor = Tutor.new(
      first_name: current_user.first_name,
      last_name: current_user.last_name,
      email: current_user.email
    )
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
      if @tutor.save
        redirect_to tutors_path(@tutor), notice: "You have successfully signed up as a mentor."
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:price, :subject_id, :qualification, :key_stage, :user_id)
  end
end
