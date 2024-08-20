class BookingsController < ApplicationController
  before_action :set_machine, only: [:new]
  before_action :check_user
  def new
  end

  def create
  end

  private

  def check_user
    redirect_to time_machine_path(@machine) if current_user == @machine.owner
  end

  def set_machine
    @machine = TimeMachine.find(params[:time_machine_id])
  end
end
