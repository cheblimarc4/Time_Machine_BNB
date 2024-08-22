class BookingsController < ApplicationController
  before_action :set_machine, only: %i[new create]
  before_action :check_user
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

  private

  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def check_user
    @machine = TimeMachine.find(params[:time_machine_id])
    redirect_to time_machine_path(@machine) if current_user == @machine.owner
  end

  def set_machine
    @machine = TimeMachine.find(params[:time_machine_id])
  end
end
