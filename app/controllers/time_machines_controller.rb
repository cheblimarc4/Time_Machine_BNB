class TimeMachinesController < ApplicationController

  def new
    @machine = TimeMachine.new
  end

  def create
    @user = current_user
    raise
  end

  private

  def timemachine_params
    params.require(:time_machine).permit(:name, :size, :speed, :comfort)
  end
end
