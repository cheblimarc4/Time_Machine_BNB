import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showallbookings"
export default class extends Controller {
  static values = {
    mymachines: Array
  }
  connect() {
    console.log(this.mymachinesValue)
  }
}
