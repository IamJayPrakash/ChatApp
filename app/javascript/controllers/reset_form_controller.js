import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // connect() {
  //   this.element.textContent = "Hello World!"
  // }
  reset() {
    console.log("doing reset after message send. :)");
    this.element.reset();
  }
}
