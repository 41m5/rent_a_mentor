class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
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
    @booking = @tutor.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@tutor), notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.destroy
      redirect_to bookings_path, notice: "Booking was successfully deleted."
    else
      redirect_to bookings_path, alert: "You are not authorized to delete this booking."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:tutor_id, :user_id, :start_date, :end_date, :day, :time, :cost)
  end

end
