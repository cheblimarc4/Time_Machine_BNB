import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="renter"
export default class extends Controller {
  static targets =["modal", "bookform", "startdate", "enddate", "price", "form", "message"]
  static values = {
    params: Object
  }

  send(event){
    event.preventDefault()
    fetch(`/time_machines/${this.paramsValue.id}/bookings`, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => {
      if (!response.ok) {
      // Attempt to parse JSON even in error cases
        console.log(response)
        return response.json().then(data => {
          this.displayMessage(data)
          });
      }
      return response.json();
    })
    .then((data) => {this.displayMessage(data)})
    .catch((errors))
  }

  displayMessage(message) {
     if (Object.keys(message).includes("errors"))
     {
      this.messageTarget.classList.add("alert", "alert-warning")
      this.messageTarget.classList.remove("d-none")
      this.messageTarget.innerHTML = message.errors
     } else
     {
      this.messageTarget.classList.remove("d-none")
      this.messageTarget.classList.add("alert", "alert-success")
      this.messageTarget.innerHTML = message.message
     }
  }


  buttonClick(){
    this.modalTarget.style.display = "block";
    this.bookformTarget.classList.remove("justify-content-center")
    this.bookformTarget.classList.add("justify-content-evenly", "p-5")
  }
  calculatePrice() {
    const Days = ((Date.parse(this.enddateTarget.value) - Date.parse(this.startdateTarget.value)) / (60000 * 60 * 24));
    const price = this.paramsValue.price * Days;
    isNaN(price) ? this.priceTarget.innerHTML = 0 : this.priceTarget.innerHTML = price + "$"
  }
  buttonClose(){
    this.modalTarget.style.display = "none";
  }
}
