class TutorsController < ApplicationController
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
    if @tutor.save
      redirect_to tutors_path(@tutor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:first_name, :last_name, :email, :price, :subject_id, :qualification, :key_stage, :user_id)
  end
end
