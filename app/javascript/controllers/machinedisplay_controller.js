import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="machinedisplay"
export default class extends Controller {
  static values = {
    machine: Object,
    bookings: Array,
    users: Array
  }
  connect() {
    console.log(this.bookingsValue);
    console.log(this.usersValue);
  }
  displayDetails() {
    let main = document.getElementById("main");
    main.innerHTML = `<h1 class="fw-bolder my-5" >${this.machineValue.name}'s bookings`;
    let template = document.getElementById("template");
    if (this.bookingsValue.length == 0) {
      main.innerHTML += "You dont have any bookings for this machine yet!"
    }
    this.bookingsValue.forEach( (booking) => {
      let card = template.content.cloneNode(true);
      card.querySelector("#machine-name").parentNode.remove();
      card.querySelector("#booker").innerHTML = `<strong> ${ this.getusername(booking.user_id)  }</strong>`;
      card.querySelector("#dates").innerHTML = `<strong> ${booking.start_date} / ${booking.end_date}</strong>`;
      const Days = ((Date.parse(booking.end_date) - Date.parse(booking.start_date)) / (60000 * 60 * 24));
      card.querySelector("#paid").innerHTML = `<strong>${this.machineValue.price * Days}$</strong>`;
      main.appendChild(card);
    })
  }

  getusername(user_id) {
    for (let i = 0; i < this.usersValue.length; i++){
      return `${this.usersValue[i].first_name} ${this.usersValue[i].last_name}`
     }
  }
}
