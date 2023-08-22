window.addEventListener('scroll', reveal);

function reveal(){
  var reveals = document.querySelectorAll('.card');
  
  for(var i = 0; i < reveals.length; i++){
    
    var windowHeight = window.innerHeight;
    var revealTop = reveals[i].getBoundingClientRect().top;
    var revealPoint = 150;

    if(revealTop < windowHeight - revealPoint){
      reveals[i].classList.add('active');
    } else{
      reveals[i].classList.remove('active');
    }
  }
}
