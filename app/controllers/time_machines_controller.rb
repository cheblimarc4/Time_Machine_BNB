class TimeMachinesController < ApplicationController
  before_action :set_machine, only: [:show, :destroy]
  def index
    @machines = TimeMachine.all
  end
  def new
    @machine = TimeMachine.new
  end

  def show
    @not_owner = @machine.owner != current_user
    @availabledate = @machine.bookings.order(:end_date).last || {}
      @marker =
      {
        lat: @machine.latitude,
        lng: @machine.longitude
      }
  end

  def destroy
    @machine.destroy
    respond_to do |format|
      msg = { status: "ok", message: "Successfully deleted #{@machine.name.empty? ? "your time machine" : @machine.name}."}
      format.json { render json: msg }
    end
  end

  def create
    @user = current_user
    @machine = TimeMachine.new(timemachine_params)
    @machine.owner = @user
    if @machine.save
      redirect_to time_machines_path
    else
      render new, status: :unprocessable_entity
    end
  end

  def mine
    @user = current_user
    @time_machine = @user.owned_time_machines
    @display_list = getbookingslist(@time_machine)
  end

  def getbookingslist(time_machine)
    display_list = []
    time_machine.each do |machine|
      next unless machine.bookings.length.positive?
      machine.bookings.each do |booking|
        display = {}
        display["start_date"] = booking.start_date
        display["end_date"] = booking.end_date
        display["user_name"] = "#{booking.user.first_name} #{booking.user.last_name}"
        display["machine_name"] = machine.name
        display["price"] = machine.price
        display_list.push(display)
      end
    end
    return display_list
  end

  private

  def set_machine
    @machine = TimeMachine.find(params[:id]);
  end

  def timemachine_params
    params.require(:time_machine).permit(:name, :size, :price, :speed, :comfort, :photo, :destination, :time_period, :time_year, :longitude, :latitude)
  end
end
