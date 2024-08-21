class AddDestinationToTimeMachine < ActiveRecord::Migration[7.1]
  def change
    add_column :time_machines, :destination, :string
  end
end
