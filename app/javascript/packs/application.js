// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("breed-form");
    form.addEventListener("submit", async (event) => {
      event.preventDefault();
      const breed = document.querySelector("[name='breed']").value;
      const response = await fetch(`/fetch_image?breed=${breed}`);
      const data = await response.json();
      document.getElementById("breed-image").innerHTML = `
        <h3>${data.breed}</h3>
        <img src="${data.image}" alt="${data.breed}" class="img-fluid">
      `;
    });
  });
  