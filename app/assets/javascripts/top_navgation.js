// Adjust the Top Menu when window scroll touch the target
function adjustTopMenu(){
  var targetElement= document.getElementById('top_navigation');
  if(targetElement === null || targetElement === undefined){ return }
  var scrollTop= window.scrollY + 70;
  var compareElementBottom= document.getElementById('adv_block').offsetHeight;
  if (scrollTop > compareElementBottom){
    if(targetElement.classList.contains('troggle_true')){ return }
    targetElement.className += ' troggle_true';
  }
  else{
    targetElement.classList.remove('troggle_true');
  }
}
