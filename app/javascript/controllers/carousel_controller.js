// app/javascript/controllers/carousel_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["carousel"];

  moveCarousel(event) {
    let currentIndex = 0;
    const direction = parseInt(event.currentTarget.dataset.direction);
    const cardWidth = this.carouselTarget.offsetWidth / 5; // Display 5 cards at a time
    const numCards = this.element.querySelectorAll(".restaurant-card").length;
    const maxIndex = Math.ceil(numCards / 5) - 1;

    currentIndex += direction;
    if (currentIndex < 0) {
      currentIndex = maxIndex;
    } else if (currentIndex > maxIndex) {
      currentIndex = 0;
    }

    const offset = -currentIndex * cardWidth * 5;
    this.carouselTarget.style.transform = `translateX(${offset}px)`;
  }
}
