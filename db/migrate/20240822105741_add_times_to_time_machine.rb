class AddTimesToTimeMachine < ActiveRecord::Migration[7.1]
  def change
    add_column :time_machines, :time_period, :string
    add_column :time_machines, :time_year, :string
  end
end
