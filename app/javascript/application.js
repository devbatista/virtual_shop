// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  document.querySelectorAll("a[data-method='delete']").forEach(link => {
    link.addEventListener("click", function(event) {
      event.preventDefault();
      if (confirm(link.dataset.confirm || "Are you sure?")) {
        fetch(link.href, {
          method: "DELETE",
          headers: {
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
            "Accept": "text/vnd.turbo-stream.html, text/html, application/xhtml+xml"
          },
          credentials: "same-origin"
        }).then(() => {
          window.location.href = "/";
        });
      }
    });
  });
});