// Adjust the Top Menu when window scroll touch the target
function adjustTopMenu(){
  var targetElement= document.getElementById('top_navigation');
  if(targetElement === null || targetElement === undefined){ return }
  var scrollTop= window.scrollY;
  var compareElementBottom= document.getElementById('home_adv').offsetHeight;
  if (scrollTop > compareElementBottom){
    targetElement.style.marginTop= '0';
  }
  else{
    targetElement.style.marginTop= '3vh';
  }
}
