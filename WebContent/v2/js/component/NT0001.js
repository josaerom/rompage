//notice
const tx0001 = document.querySelector('.TX0001');
if(sessionStorage.getItem('top-notice-off') === null){
	tx0001.classList.remove('hidden');
}else{
	tx0001.classList.add('hidden');
}

tx0001.querySelector('.c-button').addEventListener('click', function(){
    sessionStorage.setItem('top-notice-off', true);
    tx0001.querySelector('.c-button').parentElement.classList.add('hidden');
})

setInterval(()=>{
   if(tx0001.querySelector('.c-rolling__txt.active').nextElementSibling === null){
       tx0001.querySelector('.c-rolling__txt.active').classList.remove('active');
        tx0001.querySelector('.c-rolling__txt').classList.add('active');
   } else {
       tx0001.querySelector('.c-rolling__txt.active').nextElementSibling.classList.add('active');
       tx0001.querySelector('.c-rolling__txt.active').classList.remove('active');
   }
},4000);
//--notice

//scroll event
let offset =0;
const body = document.querySelector('body');
const bn0001 = document.querySelector('.BN0001');
const bn0002 = document.querySelector('.BN0002');
const bn0003 = document.querySelector('.BN0003');
const ls0001 = document.querySelector('.LS0001');
const ls0002 = document.querySelector('.LS0002');
const tx0002 = document.querySelector('.TX0002');
function scrollEvt() {
    offset = window.scrollY;
    if(offset > bn0002.offsetTop - 300){
        bn0001.classList.add('opacity-0');
        bn0002.classList.add('active');
        body.classList.add('bg-beige');                
    }else{
        bn0001.classList.remove('opacity-0');
        bn0002.classList.remove('active');
        body.classList.remove('bg-beige');
    }
    
    if(offset > ls0001.offsetTop - 300){
        ls0001.classList.add('active');
        body.classList.add('bg-white');
    }else{
		ls0001.classList.remove('active');
		body.classList.remove('bg-white');
	}
    
    if(offset > bn0003.offsetTop - 300){
        bn0003.classList.add('active');
    }else{
		bn0003.classList.remove('active');
	}
	
	if(offset > tx0002.offsetTop - 300){
        tx0002.classList.add('active');
    }else{
		tx0002.classList.remove('active');
	}
	
	if(offset > ls0002.offsetTop - 300){
        ls0002.classList.add('active');
    }else{
		ls0002.classList.remove('active');
	}
	
    tx0002.querySelector('.c-floating-contents__floor').style.top = (tx0002.offsetTop - offset - 200 ) * 1.5  + 'px';
}
window.addEventListener('scroll', scrollEvt );
//--scroll event

