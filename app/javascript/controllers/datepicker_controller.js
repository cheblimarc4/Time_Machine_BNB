import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = {
    lastbooking: Object
  }
  connect() {
    console.log(this.lastbookingValue);
    flatpickr(this.element, {
        minDate: this.lastbookingValue.end_date || "today"
    })
  }
}
