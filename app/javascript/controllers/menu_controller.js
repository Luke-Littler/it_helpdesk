import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "users", "operators", "equipment", "problems", "software", "specialists" ]
  connect() {
  }

  toggleBackground(id) {
    document.getElementById(id).classList.toggle("bg-gray-800");
  }

  toggleUsers() {
    this.usersTarget.classList.toggle('hidden');
    this.operatorsTarget.classList.add('hidden');
    this.equipmentTarget.classList.add('hidden');
    this.problemsTarget.classList.add('hidden');
    this.softwareTarget.classList.add('hidden');
    this.specialistsTarget.classList.add('hidden');
    let id = "usersButton";
  }

  toggleOperators() {
    this.operatorsTarget.classList.toggle('hidden');
    this.usersTarget.classList.add('hidden');
    this.equipmentTarget.classList.add('hidden');
    this.problemsTarget.classList.add('hidden');
    this.softwareTarget.classList.add('hidden');
    this.specialistsTarget.classList.add('hidden');
  }

  toggleEquipment() {
    this.equipmentTarget.classList.toggle('hidden');
    this.usersTarget.classList.add('hidden');
    this.operatorsTarget.classList.add('hidden');
    this.problemsTarget.classList.add('hidden');
    this.softwareTarget.classList.add('hidden');
    this.specialistsTarget.classList.add('hidden');
  }

  toggleProblems() {
    this.problemsTarget.classList.toggle('hidden');
    this.usersTarget.classList.add('hidden');
    this.operatorsTarget.classList.add('hidden');
    this.equipmentTarget.classList.add('hidden');
    this.softwareTarget.classList.add('hidden');
    this.specialistsTarget.classList.add('hidden');
  }

  toggleSoftware() {
    this.softwareTarget.classList.toggle('hidden');
    this.usersTarget.classList.add('hidden');
    this.operatorsTarget.classList.add('hidden');
    this.equipmentTarget.classList.add('hidden');
    this.problemsTarget.classList.add('hidden');
    this.specialistsTarget.classList.add('hidden');
  }

  toggleSpecialists() {
    this.specialistsTarget.classList.toggle('hidden');
    this.usersTarget.classList.add('hidden');
    this.operatorsTarget.classList.add('hidden');
    this.equipmentTarget.classList.add('hidden');
    this.problemsTarget.classList.add('hidden');
    this.softwareTarget.classList.add('hidden');
  }
}
