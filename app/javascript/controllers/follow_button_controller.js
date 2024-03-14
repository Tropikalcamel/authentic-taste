import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow-button"
export default class extends Controller {
  static targets = ['button']

    connect() {
      console.log("hey");
    }

    toggleFollow(event) {

      const isActive = event.currentTarget.classList.contains('active-follow');
      event.currentTarget.classList.toggle('active-follow')
      if (isActive) {
        console.log("DELETE");
        this.destroyFollower(event);
      } else {
        console.log("CREATE");
        this.createFollower(event)
      }

      const button = event.currentTarget;
      const buttonText = button.querySelector(".v57_400")

      if (buttonText.innerHTML === "Follow") {
          buttonText.innerHTML = "Unfollow";
          buttonText.style.color = "#8c800d"; // Change text color to black
          buttonText.style.border = " 1px solid #afa011"; // Add border
          buttonText.style.background= "#afa01100"
      } else {
          buttonText.innerHTML = "Follow";
          // buttonText.style.color = ""; // Reset text color
          // buttonText.style.border = ""; // Reset border
          // buttonText.style.padding = ""; // Reset padding
            buttonText.style.padding = "8px 16px";
          buttonText.style.backgroundColor = "#afa011";
          buttonText.style.color = "#fff";
          buttonText.style.border = "none";
          buttonText.style.borderRadius = "20px";
          buttonText.style.cursor = "pointer";
      }
    }

    createFollower(event) {
      const taster = event.currentTarget.querySelector(".taster-btn").dataset.taster;
      const url = `users/${taster}/followers`


      fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        // body: JSON.stringify({taster_id: taster_id})
      })
    }

    destroyFollower(event) {
      const taster = event.currentTarget.querySelector(".taster-btn").dataset.taster;
      const url = `users/${taster}/followers_destroy`

      fetch(url, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
      })
  }
}
