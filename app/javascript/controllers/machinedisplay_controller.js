import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="machinedisplay"
export default class extends Controller {
  static values = {
    machine: Object,
    bookings: Array
  }
  connect() {
  }
  displayDetails() {
    let main = document.getElementById("main");
    main.innerHTML = `<h1>${this.machineValue.name}'s bookings`;
    let template = document.getElementById("template");
    if (this.bookingsValue.length == 0) {
      main.innerHTML += "You dont have any bookings for this machine yet!"
    }
    this.bookingsValue.forEach( (booking) => {
      let card = template.content.cloneNode(true);
      card.querySelector("#booker").innerHTML = "Booked by:<strong> user's name </strong>";
      card.querySelector("#dates").innerHTML = `<strong> Start: ${booking.start_date} - End: ${booking.end_date}</strong>`;
      const Days = ((Date.parse(booking.end_date) - Date.parse(booking.start_date)) / (60000 * 60 * 24));
      card.querySelector("#paid").innerHTML = `Paid:<strong>${this.machineValue.price * Days}$</strong>`;
      main.appendChild(card);
    })
  }
}
