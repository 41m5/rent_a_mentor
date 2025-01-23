class BookingsController < ApplicationController
def index
  if params[:tutor_id]
    @bookings = Booking.where(tutor_id: params[:tutor_id], user: current_user)
  else
    @bookings = current_user.bookings
  end
end


  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @tutor = Tutor.find(params[:tutor_id])
    @booking = Booking.new
  end

  def create
    @tutor = Tutor.find(params[:tutor_id])
    @booking = @tutor.bookings.create(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to tutor_bookings_path(@tutor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:tutor_id, :user_id, :start_date, :end_date, :day, :time, :cost)
  end

end
