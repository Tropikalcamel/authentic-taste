import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="like-button"
export default class extends Controller {
static targets = ['heart', 'button']

  connect() {
    console.log("hey");
  }

  toggleFavorite(event) {
    const isActive = event.currentTarget.classList.contains('active');
    event.currentTarget.classList.toggle('active')
    if (isActive) {
      console.log("DELETE");
      this.destroyBookmark(event);
    } else {
      console.log("CREATE");
      this.createBookmark(event)
    }
  }

  createBookmark(event) {
    const url = `users/${event.srcElement.dataset.user}/bookmarks`
    const restaurant = event.srcElement.dataset.restaurant

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({restaurant_id: restaurant})
    })
  }

  destroyBookmark(event) {
    const restaurant = event.srcElement.dataset.restaurant
    const url = `restaurants/${restaurant}/bookmark_destroy`
    fetch(url, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
    })
  }
}
