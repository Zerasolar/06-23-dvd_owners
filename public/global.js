function menuCreate(){
  var list = document.getElementsByClassName("menu")[0];
  list.classList.toggle("show");
  
}

var menu_button_click = document.getElementsByClassName("menu_button")[0];

menu_button_click.onclick = menuCreate;