//alert('SOY FRONTEND');

const setActive = () => {
  $('.carousel-item').first().addClass('active');
}

// Call
$(document).on('turbolinks:load', function(){
  if ($('.main.index').length != 0) {
    setActive()
  }
})
