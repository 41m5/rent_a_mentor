class TutorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
    @tutor.first_name = current_user.first_name
    @tutor.last_name = current_user.last_name
    @tutor.email = current_user.email
    @tutor.subject
      if @tutor.save!
        redirect_to tutors_path(@tutor), notice: "You have successfully signed up as a mentor."
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:price, :qualification, :key_stage)
  end
end
