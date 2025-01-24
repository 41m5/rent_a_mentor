class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = current_user.favourites.includes(:tutor)
  end

  def create
    @tutor = Tutor.find(params[:tutor_id])
    favourite = current_user.favourites.find_or_initialize_by(tutor: @tutor)

    if favourite.save
      redirect_to tutor_path(@tutor), notice: "Tutor added to favourites."
    else
      redirect_to tutor_path(@tutor), alert: "Unable to add tutor to favourites."
    end
  end

  def update
    @favourite = current_user.favourites.find(params[:id])

    if @favourite.update(rating: params[:favourite][:rating])
      redirect_to tutor_path(@favourite.tutor), notice: "Rating updated successfully."
    else
      redirect_to tutor_path(@favourite.tutor), alert: "Failed to update the rating."
    end
  end

  def destroy
    favourite = current_user.favourites.find(params[:id])

    if favourite.destroy
      redirect_to tutors_path, notice: "Tutor removed from favourites."
    else
      redirect_to tutors_path, alert: "Failed to remove tutor from favourites."
    end
  end
end
