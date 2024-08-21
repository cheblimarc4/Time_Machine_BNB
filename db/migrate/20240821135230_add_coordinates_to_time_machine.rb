class AddCoordinatesToTimeMachine < ActiveRecord::Migration[7.1]
  def change
    add_column :time_machines, :latitude, :float
    add_column :time_machines, :longitude, :float
  end
end
