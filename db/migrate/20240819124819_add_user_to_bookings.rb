class AddUserToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :buyer_id, :bigint
    add_foreign_key :bookings, :users, column: :buyer_id
  end
end
