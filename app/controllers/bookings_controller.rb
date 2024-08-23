class BookingsController < ApplicationController
  before_action :set_machine, only: %i[new create]
  before_action :check_user, only: %i[new create]
  def new
  end

  def create
    @booking = Booking.new(set_params)
    @booking.user = current_user
    @booking.time_machine = @machine
    respond_to do |format|
      if @booking.save
        format.json
      else
        format.json { render json: { errors: "You can not leave the dates empty" }, status: :unprocessable_entity }
      end
    end

  end
  def mine
    @my_bookings = Booking.where(user: current_user)
  end
  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def check_user
    if current_user == @machine.owner
      render json: { errors: "You can not book your own time machine" }, status: :unprocessable_entity
    else
      @machine = TimeMachine.find(params[:time_machine_id])
    end
  end

  def set_machine
    @machine = TimeMachine.find(params[:time_machine_id])
  end
end
