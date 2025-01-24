class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings.includes(:tutor)
  end

  def show
    # Booking is already set by the before_action
  end

  def new
    @tutor = Tutor.find(params[:tutor_id])
    @booking = Booking.new
  end

  def create
    @tutor = Tutor.find(params[:tutor_id])
    if @tutor.user == current_user
      redirect_to bookings_path, alert: "You cannot book yourself."
      return
    end

    @booking = @tutor.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Booking is already set by the before_action
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Booking updated successfully."
    else
      flash[:alert] = "Failed to update the booking: #{@booking.errors.full_messages.join(', ')}"
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    if @booking.user == current_user
      @booking.destroy
      redirect_to bookings_path, notice: "Booking was successfully deleted."
    else
      redirect_to bookings_path, alert: "You are not authorized to delete this booking."
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:tutor_id, :user_id, :start_date, :end_date, :day, :time)
  end
end
