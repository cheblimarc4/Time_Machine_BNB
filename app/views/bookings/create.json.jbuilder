if @booking.persisted?
  json.message "Booking created successfully."
  json.booking do
    json.id @booking.id
    json.start_date @booking.start_date
    json.end_date @booking.end_date
    json.user_id @booking.user.id
    json.time_machine_id @booking.time_machine.id
  end
else
  json.message "There were errors with your submission."
  json.errors @booking.errors.full_messages
end
