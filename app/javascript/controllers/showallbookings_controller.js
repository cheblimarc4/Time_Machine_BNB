import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showallbookings"
export default class extends Controller {
  static values = {
    mybookings: Array
  }
  connect() {
    this.displayAllBookings();
  }
  displayAllBookings(){
    let main = document.getElementById("main");
    main.innerHTML = `<h1 class="fw-bolder my-5"> Your bookings </h1>`;
    let template = document.getElementById("template");
    if (this.mybookingsValue.length == 0) {
      main.innerHTML += "You dont have any bookings for this machine yet!"
    }
    this.mybookingsValue.forEach( (booking) => {
      this.createHTML(booking)
    })
  }
  createHTML(booking) {
    let card = template.content.cloneNode(true);
    let additional = card.querySelector("#machine-name")
    let text = document.createElement("p");
    const Days = ((Date.parse(booking.end_date) - Date.parse(booking.start_date)) / (60000 * 60 * 24));
    additional.innerHTML = `<strong>${booking.machine_name}</strong>`;
    text.innerHTML = "<p> Machine name: </p>"
    additional.parentNode.insertBefore(text, additional);
    card.querySelector("#booker").innerHTML = `<strong>${booking.user_name}</strong>`;
    card.querySelector("#dates").innerHTML = `<strong> ${booking.start_date} / ${booking.end_date}</strong>`;
    card.querySelector("#paid").innerHTML = `<strong>${booking.price * Days}$</strong>`;
    main.appendChild(card);
  }
}
