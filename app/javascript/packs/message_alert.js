const alert = document.getElementById("alert-signal");
// const alert = document.querySelectorAll(".link-item")
console.log(alert);
console.log(document.querySelectorAll(".favorites-button"));
document.querySelectorAll(".favorites-button").forEach((button) => {
  button.addEventListener("click", (event) => {
  alert.classList.toggle("hidden");

});
});
