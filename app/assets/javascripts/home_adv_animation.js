window.onload = function() {
    var element = document.getElementById('home_string_logo');
    var event = element.addEventListener("animationend", fadeAdvProduct, false);
    function fadeAdvProduct(){
      var targetElement = document.getElementById('home_adv_product');
      targetElement.className += 'fade_out';
    }
  }
