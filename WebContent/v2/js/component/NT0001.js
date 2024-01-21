//notice
if(sessionStorage.getItem('top-notice-off') === null){
	document.querySelector('.NT0001').classList.remove('hidden');
}else{
	document.querySelector('.NT0001').classList.add('hidden');
}

document.querySelector('.right-gutter').addEventListener('click', function(){
    sessionStorage.setItem('top-notice-off', true);
    document.querySelector('.right-gutter').parentElement.classList.add('hidden');
})

setInterval(()=>{
   if(document.querySelector('.NT0001 .c-rolling__txt.active').nextElementSibling === null){
       document.querySelector('.NT0001 .c-rolling__txt.active').classList.remove('active');
        document.querySelector('.NT0001 .c-rolling__txt').classList.add('active');
   } else {
       document.querySelector('.NT0001 .c-rolling__txt.active').nextElementSibling.classList.add('active');
        document.querySelector('.NT0001 .c-rolling__txt.active').classList.remove('active');
   }
},4000);
//--notice

//main
setInterval(()=>{
   if(document.querySelector('.BN0001 .c-rolling__txt.active').nextElementSibling === null){
       document.querySelector('.BN0001 .c-rolling__txt.active').classList.remove('active');
        document.querySelector('.BN0001 .c-rolling__txt').classList.add('active');
   } else {
       document.querySelector('.BN0001 .c-rolling__txt.active').nextElementSibling.classList.add('active');
        document.querySelector('.BN0001 .c-rolling__txt.active').classList.remove('active');
   }
},2000);
//--main

//scroll event
let offset =0;
function scrollEvt() {
    offset = window.scrollY;
    if(offset > document.querySelector('.BN0002').offsetTop - 300){
        document.querySelector('.BN0001').classList.add('opacity-0');
        document.querySelector('.BN0002').classList.add('active');
        document.querySelector('body').classList.add('bg-beige');
        document.querySelector('body').classList.remove('bg-white');
        document.querySelector('.LS0001').classList.remove('active');
    }else{
        document.querySelector('.BN0001').classList.remove('opacity-0');
        document.querySelector('.BN0002').classList.remove('active');
        document.querySelector('body').classList.remove('bg-beige');
    }
    if(offset > document.querySelector('.LS0001').offsetTop - 300){
        document.querySelector('.LS0001').classList.add('active');
        document.querySelector('body').classList.add('bg-white');
    }
    document.querySelector('.TX0002 .c-floating-contents__floor').style.top = (document.querySelector('.TX0002').offsetTop - offset - 200 ) * 1.5  + 'px';
}
window.addEventListener('scroll', scrollEvt );
//--scroll event

