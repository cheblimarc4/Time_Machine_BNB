import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mine"
export default class extends Controller {
  static values = { booking: Object}
  connect() {
    console.log(this.bookingValue)
  }
 cancel (event) {
    event.preventDefault()
    fetch(`/time_machines/${this.bookingValue.time_machine_id}/bookings/${this.bookingValue.id}`, {
      method: "DELETE",
      headers: { "Accept": "application/json" },
    })
    .then(response => response.json())
    .then(this.element.remove())
  }
}
