import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="arrow-button"

export default class extends Controller {
  static targets = ['arrow', 'button', 'carousel']

  connect() {
  }

  moveCarousel(event) {
    let currentIndex = 0;
    const carousel = this.carouselTarget;
    const cardWidth = carousel.offsetWidth / 5; // Display 5 cards at a time
    const numCards = carousel.querySelectorAll('.restaurant-card').length;
    const maxIndex = Math.ceil(numCards / 5) - 1;

    currentIndex += event.currentTarget.dataset.direction;
    if (currentIndex < 0) {
      currentIndex = maxIndex;
    } else if (currentIndex > maxIndex) {
      currentIndex = 0;
    }

    const offset = -currentIndex * cardWidth * 5;
    carousel.style.transform = `translateX(${offset}px)`;
  }
}
