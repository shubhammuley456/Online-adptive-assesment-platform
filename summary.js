  /*-----------------------------------------TEST--------------------------------------*/
function easy_inc(){

var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");

var counter=Number(percent.textContent)+1.33;

progress=Number(counter)*5;
    
prg.style.width=progress+"px";
percent.innerHTML=counter;

/*-----------------INTERACTIVE-----------------------------------------*/
   if(parseInt(counter)==1){
   prg.style['background-color']="#F60100";
   mylevel.innerHTML="Novice";
  }
  if (parseInt(counter)==20)
   {

 prg.style['background-color']="#E51E2B";
   mylevel.innerHTML="Adv. Beginner";

   }
  if(parseInt(counter)==40){
 prg.style['background-color']="#FF9A00";
   mylevel.innerHTML="Competent";
    
  }
   if(parseInt(counter)==60){
     prg.style['background-color']="#FCBD34";
   mylevel.innerHTML="Proficient";

  }
  if(parseInt(counter)==80){
 prg.style['background-color']="#6DB432";
   mylevel.innerHTML="Expert";
    
  }

/*-----------------INTERACTIVE-----------------------------------------*/

}

function medium_inc(){

var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");

var counter=Number(percent.textContent)+2.66;

progress=Number(counter)*5;
    
prg.style.width=progress+"px";
percent.innerHTML=counter;



/*-----------------------------------INCREMENT-------------------------------------*/

/*-----------------INTERACTIVE-----------------------------------------*/
   if(parseInt(counter)==1){
   prg.style['background-color']="#F60100";
   mylevel.innerHTML="Novice";
  }
  if (parseInt(counter)==20)
   {

 prg.style['background-color']="#E51E2B";
   mylevel.innerHTML="Adv. Beginner";

   }
  if(parseInt(counter)==40){
 prg.style['background-color']="#FF9A00";
   mylevel.innerHTML="Competent";
    
  }
   if(parseInt(counter)==60){
     prg.style['background-color']="#FCBD34";
   mylevel.innerHTML="Proficient";

  }
  if(parseInt(counter)==80){
 prg.style['background-color']="#6DB432";
   mylevel.innerHTML="Expert";
    
  }


/*-----------------INTERACTIVE-----------------------------------------*/

}

function hard_inc(){

var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");

var counter=Number(percent.textContent)+3.63;

progress=Number(counter)*5;
    
prg.style.width=progress+"px";
percent.innerHTML=counter;

/*-----------------------------------INCREMENT-------------------------------------*/

/*-----------------INTERACTIVE-----------------------------------------*/
   if(parseInt(counter)==1){
   prg.style['background-color']="#F60100";
   mylevel.innerHTML="Novice";
  }
  if (parseInt(counter)==20)
   {

 prg.style['background-color']="#E51E2B";
   mylevel.innerHTML="Adv. Beginner";

   }
  if(parseInt(counter)==40){
 prg.style['background-color']="#FF9A00";
   mylevel.innerHTML="Competent";
    
  }
   if(parseInt(counter)==60){
     prg.style['background-color']="#FCBD34";
   mylevel.innerHTML="Proficient";

  }
  if(parseInt(counter)==80){
 prg.style['background-color']="#6DB432";
   mylevel.innerHTML="Expert";
    
  }


/*-----------------INTERACTIVE-----------------------------------------*/

}
