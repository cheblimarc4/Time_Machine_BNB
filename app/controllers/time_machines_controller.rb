class TimeMachinesController < ApplicationController
  def index
    @machines = TimeMachine.all
  end
  def new
    @machine = TimeMachine.new
  end

  def create
    @user = current_user
    @machine = TimeMachine.new(timemachine_params)
    @machine.owner = @user
    if @machine.save
      redirect_to root_path
    else
      render new, status: :unprocessable_entity
    end
  end
  private

  def timemachine_params
    params.require(:time_machine).permit(:name, :size, :speed, :comfort)
  end
end
