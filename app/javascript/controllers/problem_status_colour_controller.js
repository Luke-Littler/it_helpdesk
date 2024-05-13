import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="problem-status-colour"
export default class extends Controller {
  static targets = ["status"]
  connect() { 
    if (this.statusTarget.classList.contains("unresolved")) {
      this.statusTarget.classList.add("bg-red-50", "text-red-700", "ring-red-600/10")
    } else if
      (this.statusTarget.classList.contains("resolved")) {
      this.statusTarget.classList.add("bg-green-50", "text-green-700", "ring-green-600/20")
    } else if
      (this.statusTarget.classList.contains("in_progress")) {
      this.statusTarget.classList.add("bg-yellow-50", "text-yellow-800", "ring-yellow-600/20")
    } else if
      (this.statusTarget.classList.contains("specialist_assigned")) {
      this.statusTarget.classList.add("bg-blue-50", "text-blue-700", "ring-blue-700/10")
    }
  }
}
