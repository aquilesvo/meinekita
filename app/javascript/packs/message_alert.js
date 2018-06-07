const alert = document.getElementById("alert-signal");
var elements = document.getElementsByClassName('fake-alert');
var requiredElement = elements[0];
var alertTimers = document.getElementsByClassName('alert-time');
var requiredTimer = alertTimers[0];

var fired = false;

window.addEventListener("scroll", function(){
  if (fired === false) {
    fired = true;
    setTimeout(function () {
      alert.classList.remove("hidden");
      requiredElement.classList.remove("pale");
      requiredElement.classList.add("red");
      requiredElement.insertAdjacentHTML('afterend', '<h4 class="alert-message">Erneute Kontaktaufnahme empfohlen!</h4>');
      requiredTimer.classList.add("hidden");
    }, 1000);
  }
}, true)


// document.querySelectorAll(".favorites-button").forEach((button) => {
//   button.addEventListener("click", (event) => {
//   alert.classList.toggle("hidden");

// });
// });




// function scrollFunction() {
//   alert.classList.remove("hidden");
//   requiredElement.classList.remove("pale");
//   requiredElement.classList.add("red");
//   requiredElement.insertAdjacentHTML('afterend', '<h3 class:"alert-message">Erneute Kontaktaufnahme empfohlen!</h3>');

// }

// window.onscroll = scrollFunction;

