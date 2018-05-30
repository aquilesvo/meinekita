function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var kitaAddress = document.getElementById('kindergarden_address');
    console.log(kitaAddress)
    if (kitaAddress) {
      var autocomplete = new google.maps.places.Autocomplete(kitaAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(kitaAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
