function timer(){

function timer(){
var counter=0;
var timeleft=125;


function convertSeconds(s){
var min=Math.floor(s/60);
var sec=s%60;
if(sec<10){
sec="0"+sec;
if(min<1){
 document.getElementById("timer").style['color']="#F60100";

}
}

return min+":"+sec;
}


setInterval(function timeIt(){
	var rem=timeleft-counter;
	var time=convertSeconds(rem);
	
document.getElementById("timer").innerHTML=time;
counter++;

if(counter==timeleft){
counter=0;


  //  document.getElementById("timer").submit();
   document.getElementById("timer_form").submit();

}
},1000);
}

}
  /*-----------------------------------------TEST--------------------------------------*/
function easy_inc(){

var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");

var counter=Number(percent.textContent)+1.33;

progress=Number(counter)*10;
    
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

progress=Number(counter)*10;
    
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

progress=Number(counter)*10;
    
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


function myprogressivebar_test()
{
var p_easy=document.getElementById("easy");
var p_medium=document.getElementById("medium");
var p_hard=document.getElementById("hard");
var p_progress=document.getElementById("e_progress");


var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");

/*-----------------------------------INCREMENT-------------------------------------*/
var easy_count=p_easy.value;


easy_count=Number(easy_count)+0.66;

var counter=easy_count;
var progress=p_progress.value;

progress=Number(progress)+6.6;
    
    prg.style.width=progress+"px";
    percent.innerHTML=counter+ '%';

p_easy.value=easy_count;
p_progress.value=progress;

/*-----------------------------------INCREMENT-------------------------------------*/
//var id=setInterval(frame,80);

//function frame(){
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

   

}


/*-----------------------------------------TEST--------------------------------------*/


function myprogressivebar(){
myFunction();
var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");
var counter=1;
var progress=10;

var id=setInterval(frame,80);

function frame(){
   if(counter==1){
   prg.style['background-color']="#F60100";
   mylevel.innerHTML="Novice";
  }
  if (counter==20)
   {

 prg.style['background-color']="#E51E2B";
   mylevel.innerHTML="Adv. Beginner";

   }
  if(counter==40){
 prg.style['background-color']="#FF9A00";
   mylevel.innerHTML="Competent";
    
  }
   if(counter==60){
     prg.style['background-color']="#FCBD34";
   mylevel.innerHTML="Proficient";

  }
  if(counter==80){
 prg.style['background-color']="#6DB432";
   mylevel.innerHTML="Expert";
    
  }

   if(counter==100 && progress==1000){
    clearInterval(id);
  } 
  else{
    progress +=10;
    counter +=1;
    
    prg.style.width=progress+"px";
    percent.innerHTML=counter+ '%';

  }

}


}

function myFunction(){
	var timercircle=document.getElementById("circle");

var counter=0;
var timeleft=60;

function convertSeconds(s){
var min=Math.floor(s/60);
var sec=s%60;
return min+":"+sec;
}


var timer_id=setInterval(function timeIt(){
	counter++;
	var rem=timeleft-counter;
	var time=convertSeconds(rem);
	
	if(counter==60){
         clearInterval(timer_id);
	}

document.getElementById("timer").innerHTML=time;
},1000);



}
