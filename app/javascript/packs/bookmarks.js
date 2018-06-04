const bookmark_button = document.querySelectorAll(".bookmark-symbol").forEach((bookmark) => {
  bookmark.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
  event.currentTarget.classList.toggle("fas");
  event.currentTarget.classList.toggle("far");
});
});


