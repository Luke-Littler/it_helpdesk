import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "profileMenu", "mobileMenu" ]
  connect() {
  }

  toggleProfileMenu() {
    if (this.profileMenuTarget.classList.contains("hidden")) {
      this.openProfileMenu()
    } else {
      this.closeProfileMenu()
    }
  }

  openProfileMenu() {
    this.profileMenuTarget.classList.remove("hidden")
  }

  closeProfileMenu() {
    this.profileMenuTarget.classList.add("hidden")
  }

  toggleMobileMenu() {
    if (this.mobileMenuTarget.classList.contains("hidden")) {
      this.openMobileMenu()
    } else {
      this.closeMobileMenu()
    }
  }

  openMobileMenu() {
    this.mobileMenuTarget.classList.remove("hidden")
  }

  closeMobileMenu() {
    this.mobileMenuTarget.classList.add("hidden")
  }
}