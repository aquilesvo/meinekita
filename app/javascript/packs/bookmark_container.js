document.querySelectorAll(".bookmark-container").forEach((bookmark) => {
  bookmark.addEventListener("click", (event) => {

  event.currentTarget.classList.toggle("selected-bookmark-container");

});
});
