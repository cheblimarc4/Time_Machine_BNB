class TimeMachinesController < ApplicationController
  before_action :set_machine, only: [:show]
  def index
    @machines = TimeMachine.all
  end
  def new
    @machine = TimeMachine.new
  end

  def show
    @not_owner = @machine.owner != current_user
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

  def set_machine
    @machine = TimeMachine.find(params[:id]);
  end

  def timemachine_params
    params.require(:time_machine).permit(:name, :size, :speed, :comfort)
  end
end
