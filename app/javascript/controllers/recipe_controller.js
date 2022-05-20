import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('click', (e) => {
      const url = `http://127.0.0.1:3000/recipes/${e.target.dataset.recipeId}/recipe_status`
      fetch(url)
      window.location.reload()
    })
  }
}